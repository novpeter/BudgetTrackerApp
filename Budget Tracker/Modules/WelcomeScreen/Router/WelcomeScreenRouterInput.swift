//
//  WelcomeScreenRouterInput.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol WelcomeScreenRouterInput: AnyObject {
    
    /// Shows sign in screen
    func showSignInScreen()
    
    /// Shows sign up screen
    func showSignUpScreen()
}
