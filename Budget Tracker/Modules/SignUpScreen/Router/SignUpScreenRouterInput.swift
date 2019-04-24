//
//  SignUpScreenRouterInput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import SCLAlertView

protocol SignUpScreenRouterInput: AnyObject {
    
    /// Calls alert managet to show alert with given title and description
    ///
    /// - Parameters:
    ///   - title: title
    ///   - subTitle: description
    ///   - type: alert type
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, type: SCLAlertViewStyle)
    
    /// Shows main screen
    func showMainScreen()
}
