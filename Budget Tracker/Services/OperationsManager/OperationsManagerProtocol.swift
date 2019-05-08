//
//  OperationsManagerProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 06/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

enum CRUDResult {
    case success
    case savingError(error: Error)
    case updatingError(error: Error)
    case deletingError(error: Error)
    case syncError(error: Error)
    case error(error: Error)
}

protocol OperationsManagerProtocol {
    
    // MARK: - CRUD methods
    
    /// Saves new operation and syncs with backend
    ///
    /// - Parameters:
    ///   - operation: new operation
    ///   - completionBlock: result of adding
    func createOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void)
    
    /// Requests operation from server. If there is any difference, updates locally
    ///
    /// - Parameters:
    ///   - serverId: operation
    ///   - successCallback: success callback
    ///   - errorCallback: error callback
    func readOperation(
        operation: OperationModel,
        success successCallback: @escaping (OperationModel) -> Void,
        error errorCallback: @escaping (CRUDResult) -> Void
    )
    
    /// Updates operation and syncs with backend
    ///
    /// - Parameters:
    ///   - operation: operation to update
    ///   - errorCallback: error of updating
    func updateOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void)
    
    /// Deletes operation and syncs with backend
    ///
    /// - Parameters:
    ///   - opeartion: operation to delete
    ///   - errorCallback: error of deleting
    func deleteOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void)
    
    
    // MARK: - Fetch operations
    
    // TODO: - implement fetching with date
}
