//
//  LogOutScreenInteractor.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class LogOutScreenInteractor: LogOutScreenInteractorInput {
    
    var presenter: LogOutScreenInteractorOutput!
    var authService: AuthServiceProtocol!
    
    func logOut() {
        authService.logOut { (result) in
            switch result {
            case .Success:
                self.presenter.showWelcomeScreen()
            case .Error(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func synchronize() {
        authService.synchronize { (result) in
            switch result {
            case .Success:
                self.presenter.showAlert(title: AlertTitles.Done, description: AlertDescriptions.SynchronizeComplete, type: .success)
            case .Error(let error):
                self.presenter.showAlert(title: AlertTitles.GenericError, description: error.localizedDescription, type: .error)
            }
        }
    }
}
