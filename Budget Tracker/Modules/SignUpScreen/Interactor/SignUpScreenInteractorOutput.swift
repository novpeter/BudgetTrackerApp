//
//  SignUpScreenInteractorOutput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import SCLAlertView

protocol SignUpScreenInteractorOutput: AnyObject {
    
    /// Notifies presenter to call alert
    ///
    /// - Parameters:
    ///   - title: alert title
    ///   - description: alert description
    ///   - alertType: alert type
    func showAlert(title: String, description: String, alertType: SCLAlertViewStyle)
}
