//
//  DetailScreenRouterInput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

protocol DetailScreenRouterInput: AnyObject {
    
    /// Calls alert managet to show alert with given title and description
    ///
    /// - Parameters:
    ///   - title: title
    ///   - subTitle: description
    ///   - type: alert type
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, type: SCLAlertViewStyle)
    
    /// Shows loading spinner
    func startLoading()
    
    /// Dismiss loading spinner
    func stopLoading()
}
