//
//  LogInScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import SCLAlertView

class LogInScreenPresenter:
    LogInScreenViewOutput,
    LogInScreenInteractorOutput,
    LogInScreenRouterOutput {
    
    weak var view: LogInScreenViewInput!
    var router: LogInScreenRouterInput!
    var interactor: LogInScreenInteractorInput!
    
    
    func logInButtonClicked(email: String?, password: String?) {
        interactor.logIn(email: email, password: password)
    }
    
    func googleLogInButtonClicked(accountId: String, token: String, email: String, fullName: String) {
        interactor.googleLogIn(accountId: accountId, token: token, email: email, fullName: fullName)
    }
    
    func forgotPasswordButtonClicked(email: String?) {
        interactor.forgotPassword(email: email)
    }
    
    
    // MARK: - LogInScreenViewOutput
    
    // MARK: - LogInScreenInteractorOutput
    
    func showAlert(title: String, description: String, alertType: SCLAlertViewStyle) {
        router.showAlert(title: title, description: description, type: alertType)
    }
    
    // MARK: - LogInScreenRouterOutput
}
