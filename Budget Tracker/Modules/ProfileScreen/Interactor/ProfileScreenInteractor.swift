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
        authService.synchronize { result in
            self.presenter.stopLoading()
            switch result {
            case .success:
                self.presenter.showAlert(title: .done, subTitle: .synchronizeComplete, alertType: .success)
            case .error(let error):
                print("Sync error: \(error.localizedDescription)")
                self.presenter.showAlert(title: .genericError, subTitle: .syncError, alertType: .error)
            }
        }
    }
}
