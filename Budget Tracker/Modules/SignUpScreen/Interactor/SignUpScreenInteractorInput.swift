//
//  SignUpScreenInteractorInput.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol SignUpScreenInteractorInput: AnyObject {
    
    /// Signs up new user
    ///
    /// - Parameters:
    ///   - name: user name
    ///   - email: user email
    ///   - password: password
    ///   - confirmedPassword: confirmed password
    func signUp(name: String?, email: String?, password: String?, confirmedPassword: String?)
}
