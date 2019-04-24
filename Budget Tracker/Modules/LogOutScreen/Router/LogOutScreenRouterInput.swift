//
//  LogOutScreenRouterInput.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

protocol LogOutScreenRouterInput: AnyObject {
 
    /// Navigates to welcome screen
    func showWelcomeScreen()
    
    /// Shows alert message
    ///
    /// - Parameters:
    ///   - title: title
    ///   - description: description
    ///   - type: type of alert
    func showAlert(title: String, description: String, type: SCLAlertViewStyle)
}
