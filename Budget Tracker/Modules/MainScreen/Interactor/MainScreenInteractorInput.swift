//
//  MainScreenInteractorInput.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol MainScreenInteractorInput: AnyObject {
 
    /// Calls operations manager to get operations for given period
    ///
    /// - Parameters:
    ///   - month: selected month
    ///   - year: selected year
    func updateValues(month: Int, year: Int)
}
