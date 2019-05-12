//
//  DetailScreenRouterInput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

enum ActionSheetResult {
    case cancel
    case delete
}

protocol DetailScreenRouterInput: AnyObject {
    
    /// Calls alert managet to show alert with given title and description
    ///
    /// - Parameters:
    ///   - title: title
    ///   - subTitle: description
    ///   - type: alert type
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, type: SCLAlertViewStyle)
    
    /// Shows action sheet to confirm deleting
    ///
    /// - Parameter completionCallback: completion callback
    func showDeleteActionSheet(completionCallback: @escaping (ActionSheetResult) -> ())
    
    /// Returns to the main screen
    func showMainScreen()
    
    /// Shows loading spinner
    func startLoading()
    
    /// Dismiss loading spinner
    func stopLoading()
}
