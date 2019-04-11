//
//  WelcomeScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class WelcomeScreenPresenter:
    WelcomeScreenViewOutput,
    WelcomeScreenInteractorOutput,
    WelcomeScreenRouterOutput {
    
    weak var view: WelcomeScreenViewInput!
    var router: WelcomeScreenRouterInput!
    var interactor: WelcomeScreenInteractorInput!
    
    
    // MARK: - WelcomeScreenViewOutput
    
    func logInButtonClicked() {
       router.showLogInScreen()
    }
    
    func signUpButtonClicked() {
       router.showSignUpScreen()
    }
    
    // MARK: - WelcomeScreenInteractorOutput
    
    // MARK: - WelcomeScreenRouterOutput
}
