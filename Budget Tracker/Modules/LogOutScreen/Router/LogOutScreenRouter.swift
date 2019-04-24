//
//  LogOutScreenRouter.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SCLAlertView

class LogOutScreenRouter: LogOutScreenRouterInput {
    
    var presenter: LogOutScreenRouterOutput!
    var welcomeAssembly: WelcomeScreenFactoryProtocol!
    
    func showAlert(title: String, description: String, type: SCLAlertViewStyle) {
        // TODO: - Connect alert manager
    }
    
    func showWelcomeScreen() {
        let welcomeScreenViewController = welcomeAssembly.getViewController()
        let navigationController = UINavigationController(rootViewController: welcomeScreenViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKey()
    }
}
