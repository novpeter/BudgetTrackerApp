//
//  LogInScreenInteractorInput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol LogInScreenInteractorInput: AnyObject {
 
    /// Log's in
    ///
    /// - Parameters:
    ///   - email: user email
    ///   - password: password
    func logIn(email: String?, password: String?)
    
    /// Log's in via google account
    ///
    /// - Parameters:
    ///   - accountId: account id
    ///   - token: token
    ///   - email: user email
    ///   - fullName: user full name
    func googleLogIn(accountId: String, token: String, email: String, fullName: String)
    
    /// Recovers password
    ///
    /// - Parameter email: user email
    func forgotPassword(email: String?)
}
