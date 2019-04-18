//
//  SignInScreenViewOutput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol SignInScreenViewOutput: AnyObject {
    
    /// Handles sign in button click
    ///
    /// - Parameters:
    ///   - email: user email
    ///   - password: password
    func signInButtonClicked(email: String?, password: String?)
    
    /// Handles google sign in button click
    ///
    /// - Parameters:
    ///   - accountId: id of user account
    ///   - token: token
    ///   - email: user email
    ///   - fullName: user full name
    func googleSignInButtonClicked(accountId: String, token: String, email: String, fullName: String)
    
    /// Handles forgot password button click
    ///
    /// - Parameter email: user email
    func forgotPasswordButtonClicked(email: String?)
}
