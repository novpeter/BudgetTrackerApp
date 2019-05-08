//
//  OperationsManager.swift
//  Budget Tracker
//
//  Created by Петр on 06/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class OperationsManager: OperationsManagerProtocol {
    
    var realmManager: RealmManagerProtocol!
    var networkManager: NetworkManagerProtocol!
    var authService: AuthServiceProtocol!
    
    
    // MARK: - CRUD operations
    
    func createOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void) {
        // 1. Save operation
        realmManager.saveObjects(objects: [operation]) { result in
            switch result {
            case .error(let savingError):
                completionCallback(.savingError(error: savingError))
            default:
                break
            }
        }
        
        // 2. Sync with backend
        authService.getCurrentUser(
            success: { (user) in
                let currentUser = user
                let userToken = currentUser.sessionToken
                let requestBody = OperationRequestBody(payload: OperationRequestModel(with: operation))
                self.networkManager.request(
                    target: .createOperation(token: userToken, operation: requestBody),
                    success: { (response) in
                        do {
                            // 3. Retrieve server id and user email
                            let response = try JSONDecoder().decode(AddingResponse.self, from: response.data)
                            let serverId = response.payload.serverId
                            let userEmail = response.payload.userEmail
                            
                            // 4. Set it
                            self.realmManager.performTransaction(
                                transaction: {
                                    operation.userEmail = userEmail
                                    operation.serverId = serverId
                                },
                                completion: { result in
                                    switch result {
                                    case .success:
                                        completionCallback(.success)
                                    case .error(let settingError):
                                        completionCallback(.savingError(error: settingError))
                                    }
                                }
                            )
                        }
                        catch let error {
                            completionCallback(.savingError(error: error))
                        }
                        
                    },
                    error: { error in
                        completionCallback(.syncError(error: error))
                    }
                )
            },
            error: { error in
                completionCallback(.savingError(error: error))
            }
        )
    }
    
    func readOperation(operation: OperationModel, success successCallback: @escaping (OperationModel) -> Void, error errorCallback: @escaping (CRUDResult) -> Void) {
        
        // 1. Get operation from realm
        
        // 2. Get operation from server
        
        // 3. Compare and update locally if needed
        
        // 4. Return operation
        
    }
    
    func updateOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void) {
        
    }
    
    func deleteOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void) {
        guard let operationClientId =  Int(operation.clientId) else {
            let error = NSError(domain: "Server error", code: 400,userInfo: [NSLocalizedDescriptionKey: "Wrong operation id"])
            completionCallback(.deletingError(error: error))
            return
        }
        
        // 1. Delete operation locally
        realmManager.deleteObjects(objects: [operation]) { result in
            switch result {
            case .error(let deletingError):
                completionCallback(.deletingError(error: deletingError))
            default:
                break
            }
        }
        
        // 2. Sync with backend
        authService.getCurrentUser(
            success: { (user) in
                let currentUser = user
                let userToken = currentUser.sessionToken
                self.networkManager.request(
                    target: .deleteOperation(token: userToken, id: operationClientId),
                    success: { (response) in
                        if  !(200...300).contains(response.statusCode) {
                            let error = NSError(domain: "Server error", code: response.statusCode,
                                userInfo: [NSLocalizedDescriptionKey: "Server cannot delete"])
                            completionCallback(.syncError(error: error))
                        }
                    },
                    error: { error in
                        completionCallback(.syncError(error: error))
                    }
                )
            },
            error: { error in
                completionCallback(.deletingError(error: error))
            }
        )
    }


}
