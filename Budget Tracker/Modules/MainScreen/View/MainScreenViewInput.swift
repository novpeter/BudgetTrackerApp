//
//  MainScreenViewInput.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol MainScreenViewInput: AnyObject {
    
    /// Sets income, expense, difference and operations values
    ///
    /// - Parameters:
    ///   - income: income value
    ///   - expense: expense value
    ///   - operations: array of operations for given period
    func setValues(income: Double, expense: Double, operations: [OperationModel])
}
