//
//  MainScreenViewOutput.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol MainScreenViewOutput: AnyObject {
    
    /// Calls presenter to show profile screen
    func showProfileClicked()
    
    /// Calls presenter to show "Add operation" screen
    func addOperationClicked()
    
    /// Calls interactor to get new values (income, expense, operations) for selected time period
    ///
    /// - Parameters:
    ///   - month: selected month
    ///   - year: selected year
    func updateValues(month: Int, year: Int)
}
