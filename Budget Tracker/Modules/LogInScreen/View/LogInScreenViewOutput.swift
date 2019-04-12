//
//  LogInScreenViewOutput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol LogInScreenViewOutput: AnyObject {
    
    /// Handles log in button click
    ///
    /// - Parameters:
    ///   - email: user email
    ///   - password: password
    func logInButtonClicked(email: String?, password: String?)
    
    /// Handles google log in button click
    ///
    /// - Parameters:
    ///   - accountId: id of user account
    ///   - token: token
    ///   - email: user email
    ///   - fullName: user full name
    func googleLogInButtonClicked(accountId: String, token: String, email: String, fullName: String)
    
    /// Handles forgot password button click
    ///
    /// - Parameter email: user email
    func forgotPasswordButtonClicked(email: String?)
}
