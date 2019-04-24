//
//  SignInScreenRouterInput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

protocol SignInScreenRouterInput: AnyObject {
    
    /// Shows alert with given title and description
    ///
    /// - Parameters:
    ///   - title: title
    ///   - description: description
    ///   - type: alert type
    func showAlert(title: String, description: String, type: SCLAlertViewStyle)
    
    /// Shows main screen
    func showMainScreen()
}
