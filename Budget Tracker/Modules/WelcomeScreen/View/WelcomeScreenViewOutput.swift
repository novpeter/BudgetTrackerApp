//
//  WelcomeScreenViewOutput.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol WelcomeScreenViewOutput: AnyObject {
    
    /// Log in button clicked
    func logInButtonClicked()
    
    /// Sign up button clicked
    func signUpButtonClicked()
}
