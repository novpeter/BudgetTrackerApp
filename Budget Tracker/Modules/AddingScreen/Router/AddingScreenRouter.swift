//
//  AddingScreenRouter.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SVProgressHUD
import SCLAlertView

class AddingScreenRouter: AddingScreenRouterInput {
    
    weak var view: UIViewController!
    var presenter: AddingScreenRouterOutput!
    var alertManager: AlertManagerProtocol!
    
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, type: SCLAlertViewStyle) {
        alertManager.show(title: title, subTitle: subTitle, type: type)
    }
    
    func closeAddingScreen() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func startLoading() {
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
}
