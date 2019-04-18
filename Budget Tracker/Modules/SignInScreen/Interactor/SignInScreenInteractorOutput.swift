//
//  SignInScreenInteractorOutput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

protocol SignInScreenInteractorOutput: AnyObject {
    
    /// Notifies presenter to call alert
    ///
    /// - Parameters:
    ///   - title: alert title
    ///   - description: alert description
    ///   - alertType: alert type
    func showAlert(title: String, description: String, alertType: SCLAlertViewStyle)
    
    /// Calls router to show main screen
    func showMainScreen()
}
