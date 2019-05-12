//
//  OperationsManagerProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 06/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

enum CRUDResult {
    case success
    case successReading(OperationModel)
    case successReadingAll([OperationModel])
    case savingError(Error)
    case updatingError(Error)
    case deletingError(Error)
    case syncError(Error)
    case readingError(Error)
    case readSyncError(Error, OperationModel)
    case error(Error)
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
    ///   - operationClientId: operation client id
    ///   - completionBlock: result of reading
    func readOperation(operationClientId: String, completion completionCallback: @escaping (CRUDResult) -> Void)
    
    /// Updates operation and syncs with backend
    ///
    /// - Parameters:
    ///   - operation: operation to update
    ///   - errorCallback: error of updating
    func updateOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void)
    
    /// Deletes operation and syncs with backend
    ///
    /// - Parameters:
    ///   - operationId: operation with id to delete
    ///   - errorCallback: error of deleting
    func deleteOperation(operationId: String, completion completionCallback: @escaping (CRUDResult) -> Void)
    
    
    // MARK: - Selection
    
    /// Gets operations with given date
    ///
    /// - Parameters:
    ///   - month: month
    ///   - year: year
    /// - Returns: array of operations
    func getOperations(month: Int, year: Int) -> [OperationModel]
}
