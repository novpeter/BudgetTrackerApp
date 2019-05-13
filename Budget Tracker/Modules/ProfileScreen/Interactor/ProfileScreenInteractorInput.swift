//
//  ProfileScreenInteractorInput.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol ProfileScreenInteractorInput: AnyObject {
    
    /// Logs out from current session
    func logOut()
 
    /// Synchronize all data with server
    func synchronize()
    
    /// Fetch user info if needs and calls presenter to set info
    func updateValues()
}
