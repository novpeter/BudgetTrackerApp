//
//  RealmManagerProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import RealmSwift

enum RealmResult {
    case success
    case error(Error)
}

protocol RealmManagerProtocol {
        
    /// Returns objects by given type
    ///
    /// - Parameter type: type of objects
    /// - Returns: list of objects
    func getObjects<T>(with type: T.Type) -> Array<T>? where T : Object
    
    /// Saves given objects in database
    ///
    /// - Parameter objects: list of objects
    /// - Parameter completionBlock: completion block
    func saveObjects<T>(objects: Array<T>, completion completionBlock: (RealmResult) -> ()) where T : Object
    
    /// Deletes objects
    ///
    /// - Parameter objects: list of objects
    /// - Parameter completionBlock: completion block
    func deleteObjects<T>(objects: Array<T>, completion completionBlock: (RealmResult) -> ()) where T : Object
    
    /// Updates given objects (replace them in realm)
    ///
    /// - Parameters:
    ///   - objects: objects to update
    ///   - completionBlock: completion block
    func updateObjects<T>(objects: Array<T>, completion completionBlock: (RealmResult) -> ()) where T: Object
    
    /// Perfoms given transaction in "write" block
    ///
    /// - Parameter transaction: given transaction
    func performTransaction(transaction: () -> (), completion completionBlock: (RealmResult) -> ())
}

