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
    
    /// Notifies presenter to call alert
    ///
    /// - Parameters:
    ///   - title: alert title
    ///   - subTitle: alert subTitle
    ///   - alertType: alert type
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, alertType: SCLAlertViewStyle)
    
    /// Calls router to show loading spinner
    func startLoading()
    
    /// Calls router to dismiss loading spinner
    func stopLoading()
}
