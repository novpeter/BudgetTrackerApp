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
    var alertManager: AlertManagerProtocol!
    
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, type: SCLAlertViewStyle) {
        alertManager.show(title: title, subTitle: subTitle, type: type)
    }
    
    func showWelcomeScreen() {
        let welcomeScreenViewController = welcomeAssembly.getViewController()
        let navigationController = UINavigationController(rootViewController: welcomeScreenViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: Fonts.PoppinsMedium16!]
        UINavigationBar.appearance().tintColor = Colors.TextColors.Black
        UINavigationBar.appearance().barTintColor = .white
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.topItem?.title = " "
        
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKey()
    }
}
