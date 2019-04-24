//
//  SignUpScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import SCLAlertView

class SignUpScreenPresenter:
    SignUpScreenViewOutput,
    SignUpScreenInteractorOutput,
    SignUpScreenRouterOutput {
    
    weak var view: SignUpScreenViewInput!
    var router: SignUpScreenRouterInput!
    var interactor: SignUpScreenInteractorInput!
    
   
    func signUpButtonClicked(name: String?, email: String?, password: String?, confirmedPassword: String?) {
        interactor.signUp(name: name, email: email, password: password, confirmedPassword: confirmedPassword)
    }
    
    // MARK: - SignUpScreenViewOutput
    
    // MARK: - SignUpScreenInteractorOutput
    
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, alertType: SCLAlertViewStyle) {
        router.showAlert(title: title, subTitle: subTitle, type: alertType)
    }
    
    func showMainScreen() {
        router.showMainScreen()
    }
    
    func startLoading() {
        router.startLoading()
    }
    
    func stopLoading() {
        router.stopLoading()
    }

    // MARK: - SignUpScreenRouterOutput
}
