//
//  SignUpScreenViewOutput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol SignUpScreenViewOutput: AnyObject {
    
    /// Handle sign up button click. Gets all text from fields
    ///
    /// - Parameters:
    ///   - name: user name
    ///   - email: user email
    ///   - password: password
    ///   - confirmedPassword: confirmed password
    func signUpButtonClicked(name: String?, email: String?, password: String?, confirmedPassword: String?)
}
