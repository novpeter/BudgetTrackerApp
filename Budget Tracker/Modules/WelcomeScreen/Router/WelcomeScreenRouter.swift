//
//  WelcomeScreenRouter.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class WelcomeScreenRouter: WelcomeScreenRouterInput {
    
    var view: WelcomeScreenViewController!
    var presenter: WelcomeScreenRouterOutput!
    var logInAssembly: LogInScreenFactoryProtocol!
    var signUpAssembly: SignUpScreenFactoryProtocol!
    
    func showLogInScreen() {
        let logInViewController = logInAssembly.getViewController()
        view.navigationController?.pushViewController(logInViewController, animated: true)
    }
    
    func showSignUpScreen() {
        let signUpViewController = signUpAssembly.getViewController()
        view.navigationController?.pushViewController(signUpViewController, animated: true)
    }
}
