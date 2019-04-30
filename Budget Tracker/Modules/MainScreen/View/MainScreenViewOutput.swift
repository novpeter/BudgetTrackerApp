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
    
    /// Calls presenter to show statistic screen
    func showStatisticClicked()
    
    /// Calls presenter to show "Add operation" screen
    func addOperationClicked()
}
