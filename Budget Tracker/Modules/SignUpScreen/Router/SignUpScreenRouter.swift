//
//  SignUpScreenRouter.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SCLAlertView

class SignUpScreenRouter: SignUpScreenRouterInput {
    
    var mainAssembly: MainScreenFactoryProtocol!
    var presenter: SignUpScreenRouterOutput!
    
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
}
