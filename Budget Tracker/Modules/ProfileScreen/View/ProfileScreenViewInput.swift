//
//  ProfileScreenViewInput.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol ProfileScreenViewInput: AnyObject {
    
    /// Sets values
    ///
    /// - Parameter email: user email
    func setValues(email: String)
}
