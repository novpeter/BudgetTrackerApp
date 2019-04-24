//
//  LogOutScreenInteractorInput.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol LogOutScreenInteractorInput: AnyObject {
    
    /// Logs out from current session
    func logOut()
 
    /// Synchronize all data with server
    func synchronize()
}
