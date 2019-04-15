//
//  LogInScreenRouter.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SCLAlertView

class LogInScreenRouter: LogInScreenRouterInput {
    
    var mainAssembly: MainScreenFactoryProtocol!
    var view: LogInScreenViewController!
    var presenter: LogInScreenRouterOutput!
    
    func showAlert(title: String, description: String, type: SCLAlertViewStyle) {
        
        switch type {
        case .error:
            SCLAlertView().showError(title, subTitle: description)
        case .info:
            SCLAlertView().showInfo(title, subTitle: description)
        case .success:
            SCLAlertView().showSuccess(title, subTitle: description)
        default:
            break
        }
    }
    
    func showMainScreen() {
        let mainScreenViewController = mainAssembly.getViewController()
        let navigationController = UINavigationController(rootViewController: mainScreenViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKey()
    }
}
