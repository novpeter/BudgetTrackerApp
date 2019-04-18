//
//  SignInScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import SCLAlertView

class SignInScreenPresenter:
    SignInScreenViewOutput,
    SignInScreenInteractorOutput,
    SignInScreenRouterOutput {
    
    weak var view: SignInScreenViewInput!
    var router: SignInScreenRouterInput!
    var interactor: SignInScreenInteractorInput!
    
    
    func signInButtonClicked(email: String?, password: String?) {
        interactor.signIn(email: email, password: password)
    }
    
    func googleSignInButtonClicked(accountId: String, token: String, email: String, fullName: String) {
        interactor.googleSignIn(accountId: accountId, token: token, email: email, fullName: fullName)
    }
    
    func forgotPasswordButtonClicked(email: String?) {
        interactor.forgotPassword(email: email)
    }
    
    
    // MARK: - SignInScreenViewOutput
    
    // MARK: - SignInScreenInteractorOutput
    
    func showAlert(title: String, description: String, alertType: SCLAlertViewStyle) {
        router.showAlert(title: title, description: description, type: alertType)
    }
    
    func showMainScreen() {
        router.showMainScreen()
    }
    
    // MARK: - SignInScreenRouterOutput
}
