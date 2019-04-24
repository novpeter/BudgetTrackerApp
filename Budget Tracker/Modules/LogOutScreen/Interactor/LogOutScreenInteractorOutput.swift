//
//  LogOutScreenInteractorOutput.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

protocol LogOutScreenInteractorOutput: AnyObject {
    
    /// Calls router to show welcome screen
    func showWelcomeScreen()
    
    /// Calls router to show alert
    ///
    /// - Parameters:
    ///   - title: title
    ///   - description: description
    ///   - type: type of alert
    func showAlert(title: String, description: String, type: SCLAlertViewStyle)
}
