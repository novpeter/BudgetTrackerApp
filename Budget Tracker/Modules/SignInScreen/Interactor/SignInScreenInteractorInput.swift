//
//  SignInScreenInteractorInput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol SignInScreenInteractorInput: AnyObject {
 
    /// Sign's in
    ///
    /// - Parameters:
    ///   - email: user email
    ///   - password: password
    func signIn(email: String?, password: String?)
    
    /// Sign's in via google account
    ///
    /// - Parameters:
    ///   - token: token
    ///   - email: user email
    ///   - fullName: user full name
    func googleSignIn(token: String, email: String, fullName: String)
    
    /// Recovers password
    ///
    /// - Parameter email: user email
    func forgotPassword(email: String?)
}
