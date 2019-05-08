//
//  RealmManager.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//


import Realm
import RealmSwift

class RealmManager: RealmManagerProtocol {
 
    fileprivate lazy var mainRealm: Realm = try! Realm(configuration: .defaultConfiguration)
    
    func getObjects<T>(with type: T.Type) -> Array<T>? where T : Object {
        return Array(mainRealm.objects(T.self))
    }
    
    func saveObjects<T>(objects: Array<T>, completion completionBlock: (RealmResult) -> ()) where T: Object {
        do {
            try mainRealm.write {
                mainRealm.add(objects)
            }
            completionBlock(.success)
        }
        catch {
            print("Error during save operation")
            completionBlock(.error(error))
        }
    }
    
    func deleteObjects<T>(objects: Array<T>, completion completionBlock: (RealmResult) -> ()) where T: Object {
        do {
            try mainRealm.write {
                mainRealm.delete(objects, cascading: true)
            }
            completionBlock(.success)
        }
        catch {
            print("Error during delete operation")
            completionBlock(.error(error))
        }
    }
    
    func updateObjects<T>(objects: Array<T>, completion completionBlock: (RealmResult) -> ()) where T: Object {
        do {
            try mainRealm.write {
                mainRealm.add(objects, update: true)
            }
            completionBlock(.success)
        }
        catch {
            print("Error during delete operation")
            completionBlock(.error(error))
        }
    }
    
    func performTransaction(transaction: () -> (), completion completionBlock: (RealmResult) -> ()) {
        do {
            try mainRealm.write {
                transaction()
            }
            completionBlock(.success)
        }
        catch {
            print("Error during perform transaction")
            completionBlock(.error(error))
        }
        
    }
    
}


protocol CascadeDeleting: class {
    func delete<S: Sequence>(_ objects: S, cascading: Bool) where S.Iterator.Element: Object
    func delete<Entity: Object>(_ entity: Entity, cascading: Bool)
}

extension Realm: CascadeDeleting {
    func delete<S: Sequence>(_ objects: S, cascading: Bool) where S.Iterator.Element: Object {
        for obj in objects {
            delete(obj, cascading: cascading)
        }
    }
    
    func delete<Entity: Object>(_ entity: Entity, cascading: Bool) {
        if cascading {
            cascadeDelete(entity)
        } else {
            delete(entity)
        }
    }
}

private extension Realm {
    private func cascadeDelete(_ entity: RLMObjectBase) {
        guard let entity = entity as? Object else { return }
        var toBeDeleted = Set<RLMObjectBase>()
        toBeDeleted.insert(entity)
        while !toBeDeleted.isEmpty {
            guard let element = toBeDeleted.removeFirst() as? Object,
                !element.isInvalidated else { continue }
            resolve(element: element, toBeDeleted: &toBeDeleted)
        }
    }
    
    private func resolve(element: Object, toBeDeleted: inout Set<RLMObjectBase>) {
        if let cascadingObject = element as? CascadeDeletable {
            element.objectSchema.properties.forEach {
                if cascadingObject.propertiesToCascadeDelete.contains($0.name) {
                    guard let value = element.value(forKey: $0.name) else { return }
                    if let entity = value as? RLMObjectBase {
                        toBeDeleted.insert(entity)
                    } else if let list = value as? RealmSwift.ListBase {
                        for index in 0..<list._rlmArray.count {
                            if let realmObject = list._rlmArray.object(at: index) as? RLMObjectBase {
                                toBeDeleted.insert(realmObject)
                            }
                        }
                    }
                }
            }
        }
        delete(element)
    }
}

protocol CascadeDeletable: class {
    var propertiesToCascadeDelete: [String] { get }
}

private extension Realm {
    private func cascadingDelete(_ object: Object) {
        var toBeDeleted = Set<RLMObjectBase>()
        toBeDeleted.insert(object)
        while !toBeDeleted.isEmpty {
            guard let element = toBeDeleted.removeFirst() as? Object, !element.isInvalidated else { continue }
            resolve(element, toBeDeleted: &toBeDeleted)
            delete(element)
        }
    }
    
    private func resolve(_ element: Object, toBeDeleted: inout Set<RLMObjectBase>) {
        guard let deletable = element as? CascadeDeletable else { return }
        let propertiesToDelete = element.objectSchema.properties.filter {
            deletable.propertiesToCascadeDelete.contains($0.name)
        }
        propertiesToDelete.forEach {
            guard let value = element.value(forKey: $0.name) else { return }
            if let object = value as? Object {
                toBeDeleted.insert(object)
            } else if let list = value as? RealmSwift.ListBase {
                for index in 0..<list._rlmArray.count {
                    guard let object = list._rlmArray.object(at: index) as? Object else { continue }
                    toBeDeleted.insert(object)
                }
            }
        }
    }
}

