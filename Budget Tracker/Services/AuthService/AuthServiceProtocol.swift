//
//  AuthServiceProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 21/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol AuthServiceProtocol {
    
    /// Sends "sign in" request to the server and saves current user
    ///
    /// - Parameters:
    ///   - email: user email
    ///   - password: user password
    ///   - completionBlock: completion block
    func signIn(email: String, password: String, completionBlock: @escaping (ResponseResult) -> ())
    
    /// Sends "sign in via google" request to the server and saves current user
    ///
    /// - Parameters:
    ///   - token: google token
    ///   - email: user email
    ///   - fullName: full name
    ///   - completionBlock: completion block
    func googleSignIn(token: String, email: String, fullName: String, completionBlock: @escaping (ResponseResult) -> ())
    
    /// Sends "sign up" request to the server and saves current user
    ///
    /// - Parameters:
    ///   - name: user name
    ///   - email: user email
    ///   - password: user password
    ///   - completionBlock: completion block
    func signUp(name: String, email: String, password: String, completionBlock: @escaping (ResponseResult) -> ())
    
    /// Sends password recovery request to the server
    ///
    /// - Parameter email: user email
    func forgotPassword(email: String)
    
    /// Sends log out request to the server
    ///
    /// - Parameter completionBlock: completion block
    func logOut(completionBlock: @escaping (ResponseResult) -> ())
    
    /// Synchronize all data with server
    ///
    /// - Parameter completionBlock: completion block
    func synchronize(completionBlock: @escaping (ResponseResult) -> ())
    
   

    /// Returns current user
    ///
    /// - Returns: current user
    func getCurrentUser() -> UserModel?
}
