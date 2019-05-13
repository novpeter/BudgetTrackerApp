//
//  ProfileScreenInteractor.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class ProfileScreenInteractor: ProfileScreenInteractorInput {
    
    var presenter: ProfileScreenInteractorOutput!
    var authService: AuthServiceProtocol!
    var operationsManager: OperationsManagerProtocol!
    
    func logOut() {
        presenter.startLoading()
        authService.logOut { result in
            self.presenter.stopLoading()
            switch result {
            case .success:
                self.presenter.showWelcomeScreen()
            case .error(let error):
                print("Log out error: \(error.localizedDescription)")
                self.presenter.showAlert(title: .genericError, subTitle: .logOutError, alertType: .error)
            }
        }
    }
    
    func synchronize() {
        presenter.startLoading()
        operationsManager.syncUnsetOperations { result in
            switch result {
            case .success:
                self.operationsManager.fetchAllOperations(completion: { fetchResult in
                    self.presenter.stopLoading()
                    switch fetchResult {
                    case .success:
                        self.presenter.showAlert(title: .done, subTitle: .empty, alertType: .success)
                    case .updatingError(let error),
                         .readingError(let error),
                         .error(let error):
                        self.presenter.stopLoading()
                        print("Sync unset operations error: \(error.localizedDescription)")
                        self.presenter.showAlert(title: .genericError, subTitle: .genericError, alertType: .error)
                    default:
                        break
                    }
                })
            case .updatingError(let error),
                 .readingError(let error),
                 .error(let error):
                self.presenter.stopLoading()
                print("Sync unset operations error: \(error.localizedDescription)")
                self.presenter.showAlert(title: .genericError, subTitle: .genericError, alertType: .error)
            default:
                break
            }
        }
    }
    
    func updateValues() {
        guard let currentUser = authService.getCurrentUser() else { return }
        presenter.setValues(email: currentUser.email)
    }
}
