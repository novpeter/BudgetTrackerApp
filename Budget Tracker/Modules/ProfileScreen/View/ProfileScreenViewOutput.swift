//
//  ProfileScreenViewOutput.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol ProfileScreenViewOutput: AnyObject {
    
    /// Sync button was clicked
    func syncButtonClicked()
    
    /// Log out button was clicked
    func logOutButtonClicked()
    
    /// Calls interactor to update user info
    func updateValues()
}
