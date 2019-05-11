//
//  MainScreenRouterInput.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol MainScreenRouterInput: AnyObject {
 
    /// Shows profile screen
    func showProfileScreen()
    
    /// Shows add screen
    func showAddScreen()
    
    /// Shows loading spinner
    func startLoading()
    
    /// Dismiss loading spinner
    func stopLoading()
}
