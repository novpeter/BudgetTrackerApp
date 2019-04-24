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
        presenter.startLoading()
        authService.logOut { (result) in
            switch result {
            case .Success:
                self.presenter.stopLoading()
                self.presenter.showWelcomeScreen()
            case .Error(let error):
                self.presenter.stopLoading()
                print("Log out error: \(error.localizedDescription)")
                self.presenter.showAlert(title: .GenericError, subTitle: .LogOutError, alertType: .error)
            }
        }
    }
    
    func synchronize() {
        presenter.startLoading()
        authService.synchronize { (result) in
            switch result {
            case .Success:
                self.presenter.stopLoading()
                self.presenter.showAlert(title: .Done, subTitle: .SynchronizeComplete, alertType: .success)
            case .Error(let error):
                self.presenter.stopLoading()
                print("Sync error: \(error.localizedDescription)")
                self.presenter.showAlert(title: .GenericError, subTitle: .SyncError, alertType: .error)
            }
        }
    }
}
