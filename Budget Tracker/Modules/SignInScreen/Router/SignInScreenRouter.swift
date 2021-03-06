//
//  SignInScreenRouter.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SCLAlertView
import SVProgressHUD

class SignInScreenRouter: SignInScreenRouterInput {
    
    var mainAssembly: MainScreenFactoryProtocol!
    var view: SignInScreenViewController!
    var presenter: SignInScreenRouterOutput!
    var alertManager: AlertManagerProtocol!
    
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, type: SCLAlertViewStyle) {
        alertManager.show(title: title, subTitle: subTitle, type: type)
    }
    
    func showMainScreen() {
        let mainScreenViewController = mainAssembly.getViewController()
        let navigationController = UINavigationController(rootViewController: mainScreenViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController.navigationBar.shadowImage = UIImage()
        
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKey()
    }
    
    func startLoading() {
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
}
