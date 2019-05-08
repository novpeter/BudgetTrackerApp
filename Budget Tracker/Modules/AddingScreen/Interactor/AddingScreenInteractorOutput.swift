//
//  AddingScreenInteractorOutput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

protocol AddingScreenInteractorOutput: AnyObject {
    
    /// Calls presenter to set values in fields
    ///
    /// - Parameters:
    ///   - selectedIndex: operation type
    ///   - category: selected category
    ///   - date: date as string
    func setValues(selectedIndex: Int, category: Categories, date: String)
    
    /// Calls router to close adding screen
    func closeAddingScreen()
    
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
