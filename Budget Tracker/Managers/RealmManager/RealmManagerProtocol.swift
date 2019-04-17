//
//  RealmManagerProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmManagerProtocol {
        
    /// Return objects by given type
    ///
    /// - Parameter type: type of objects
    /// - Returns: list of objects
    func getObjects<T>(with type: T.Type) -> Array<T>? where T : Object
    
    /// Save given objects in database
    ///
    /// - Parameter objects: list of objects
    func saveObjects<T>(objects: Array<T>, errorBlock: (Error?) -> ()) where T : Object
    
    /// Delete objects
    ///
    /// - Parameter objects: list of objects
    func deleteObjects<T>(objects: Array<T>, errorBlock: (Error?) -> ()) where T : Object
    
    /// Perfom given transaction in "write" block
    ///
    /// - Parameter transaction: given transaction
    func performTransaction(transaction: () -> (), errorBlock: (Error?) -> ())
}

