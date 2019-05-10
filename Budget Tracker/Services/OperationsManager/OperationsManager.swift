//
//  OperationsManager.swift
//  Budget Tracker
//
//  Created by Петр on 06/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import RealmSwift

class OperationsManager: OperationsManagerProtocol {
    
    var realmManager: RealmManagerProtocol!
    var networkManager: NetworkManagerProtocol!
    var authService: AuthServiceProtocol!
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    private lazy var calendar = Calendar.current
    
    // MARK: - CRUD operations
    
    func createOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void) {
        // 1. Save operation
        realmManager.saveObjects(objects: [operation]) { result in
            switch result {
            case .error(let savingError):
                completionCallback(.savingError(savingError))
            default:
                break
            }
        }
        
        // 2. Sync with backend
        guard let currentUser = authService.getCurrentUser() else {
            let error = NSError(
                domain: "Realm error",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Cannot get current user"]
            )
            completionCallback(.readingError(error))
            return
        }
        
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
                                completionCallback(.savingError(settingError))
                            }
                        }
                    )
                }
                catch let error {
                    completionCallback(.savingError(error))
                }
            },
            error: { error in
                completionCallback(.syncError(error))
            }
        )
    }
    
    func readOperation(operationClientId: String, completion completionCallback: @escaping (CRUDResult) -> Void) {
        // 1. Get operation from realm
        guard let operation = realmManager.getObjects(with: OperationModel.self).first(where: { $0.clientId == operationClientId })
            else {
                let error = NSError(
                    domain: "Realm error",
                    code: 400,
                    userInfo: [NSLocalizedDescriptionKey: "No operation with given client id"]
                )
                completionCallback(.readingError(error))
            return
        }
        
        guard let currentUser = authService.getCurrentUser() else {
            let error = NSError(
                domain: "Realm error",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Cannot get current user"]
            )
            completionCallback(.readingError(error))
            return
        }
        
        // 2. Get operation from server
        networkManager.request(
            target: .getOperation(token: currentUser.sessionToken, id: operationClientId),
            success: { response in
                do
                {
                    // 3. Retrieve, compare and update locally
                    let response = try JSONDecoder().decode(GetOperationResponse.self, from: response.data)
                    let operationFromServer = response.payload
                    self.realmManager.performTransaction(
                        transaction: {
                            operation.clientId = operationFromServer.clientId
                            operation.serverId = operationFromServer.serverId
                            operation.userEmail = operationFromServer.userEmail
                            operation.type = operationFromServer.type
                            operation.title = operationFromServer.title
                            operation.comment = operationFromServer.comment
                            operation.category = operationFromServer.category
                            operation.date = self.dateFormatter.date(from: operationFromServer.date) ?? Date()
                            operation.sum = operationFromServer.sum
                        },
                        completion: { result in
                            switch result {
                            case .success:
                                completionCallback(.successReading(operation))
                            case.error(let error):
                                completionCallback(.readingError(error))
                            }
                        }
                    )
                }
                catch let error {
                    completionCallback(.syncError(error))
                }
            },
            error: { error in
                completionCallback(.successReading(operation))
            }
        )
    }
    
    func updateOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void) {
        // 1. Update localy
        realmManager.updateObjects(objects: [operation]) { result in
            switch result {
            case .error(let updatingError):
                completionCallback(.updatingError(updatingError))
            default:
                break
            }
        }
        
        guard let currentUser = authService.getCurrentUser() else {
            let error = NSError(
                domain: "Realm error",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Cannot get current user"]
            )
            completionCallback(.readingError(error))
            return
        }
        
        // 2. Sync with server
        let requestBody = OperationRequestBody(payload: OperationRequestModel(with: operation))
        
        networkManager.request(
            target: .updateOperation(token: currentUser.sessionToken, operation: requestBody),
            success: { response in
                if  !(200...300).contains(response.statusCode) {
                    let error = NSError(
                        domain: "Server error",
                        code: response.statusCode,
                        userInfo: [NSLocalizedDescriptionKey: "Server cannot update operation"]
                    )
                    completionCallback(.syncError(error))
                }
                else {
                    completionCallback(.success)
                }
            },
            error: { error in
                completionCallback(.syncError(error))
            }
        )
    }
    
    func deleteOperation(operation: OperationModel, completion completionCallback: @escaping (CRUDResult) -> Void) {
        let operationClientId =  operation.clientId
        
        // 1. Delete operation locally
        realmManager.deleteObjects(objects: [operation]) { result in
            switch result {
            case .error(let deletingError):
                completionCallback(.deletingError(deletingError))
            default:
                break
            }
        }
        
        guard let currentUser = authService.getCurrentUser() else {
            let error = NSError(
                domain: "Realm error",
                code: 400,
                userInfo: [NSLocalizedDescriptionKey: "Cannot get current user"]
            )
            completionCallback(.readingError(error))
            return
        }
        
        // 2. Sync with server
        networkManager.request(
            target: .deleteOperation(token: currentUser.sessionToken, id: operationClientId),
            success: { (response) in
                if  !(200...300).contains(response.statusCode) {
                    let error = NSError(
                        domain: "Server error",
                        code: response.statusCode,
                        userInfo: [NSLocalizedDescriptionKey: "Server cannot delete"]
                    )
                    completionCallback(.syncError(error))
                }
                else {
                    completionCallback(.success)
                }
            },
            error: { error in
                completionCallback(.syncError(error))
            }
        )
    }
    
    
    // MARK: - Statistic
    
    func getOperations(month: Int, year: Int) -> [OperationModel] {
        let operations = realmManager.getObjects(with: OperationModel.self).filter({ operation -> Bool in
            let date = operation.date
            let components = self.calendar.dateComponents([.day, .month, .year], from: date)
            return components.month == month && components.year == year
        })
        return operations
    }
}
