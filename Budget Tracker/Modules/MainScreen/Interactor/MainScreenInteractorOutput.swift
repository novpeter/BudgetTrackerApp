//
//  MainScreenInteractorOutput.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol MainScreenInteractorOutput: AnyObject {
    
    /// Calls view to set values in Main screen
    ///
    /// - Parameters:
    ///   - income: income value
    ///   - expense: expense value
    ///   - operations: list of operations
    func setValues(income: Int, expense: Int, operations: [OperationModel])
    
    /// Calls router to show loading spinner
    func startLoading()
    
    /// Calls router to dismiss loading spinner
    func stopLoading()
}
