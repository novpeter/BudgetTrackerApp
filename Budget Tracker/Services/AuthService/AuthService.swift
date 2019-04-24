//
//  AuthService.swift
//  Budget Tracker
//
//  Created by Петр on 21/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import GoogleSignIn

enum ResponseResult {
    case Success
    case Error(Error)
}

class AuthService: AuthServiceProtocol {
    
    var networkManager: NetworkManagerProtocol!
    var realmManager: RealmManagerProtocol!
 
    func signIn(email: String, password: String, completionBlock: @escaping (ResponseResult) -> ()) {
        let user = SignInUser(fullName: nil, email: email, token: nil, password: password)
        let requestBody = SignInRequestBody(authType: AuthType.Regular, payload: user)
        
        networkManager.request(target: .signIn(body: requestBody), success: { (response) in
            do
            {
                let response = try JSONDecoder().decode(AuthResponse.self, from: response.data)
                let currentUser = UserModel()
                currentUser.email = email
                currentUser.fullName = ""
                currentUser.sessionToken = response.payload.sessionToken
                
                self.realmManager.saveObjects(objects: [currentUser], errorBlock: { (error) in
                    if let error = error {
                        completionBlock(.Error(error))
                    }
                })
                
                completionBlock(.Success)
            }
            catch let error {
                completionBlock(.Error(error))
            }
        }, error: { (error) in
            completionBlock(.Error(error))
        })
    }
    
    func googleSignIn(token: String, email: String, fullName: String, completionBlock: @escaping (ResponseResult) -> ()) {
        let user = SignInUser(fullName: fullName, email: email, token: token, password: nil)
        let requestBody = SignInRequestBody(authType: AuthType.Google, payload: user)
        
        networkManager.request(target: .signIn(body: requestBody), success: { (response) in
            do
            {
                let response = try JSONDecoder().decode(AuthResponse.self, from: response.data)
                let currentUser = UserModel()
                currentUser.email = email
                currentUser.fullName = fullName
                currentUser.sessionToken = response.payload.sessionToken
                
                self.realmManager.saveObjects(objects: [currentUser], errorBlock: { (error) in
                    if let error = error {
                        completionBlock(.Error(error))
                    }
                })
                
                completionBlock(.Success)
            }
            catch let error {
                completionBlock(.Error(error))
            }
        }, error: { (error) in
            completionBlock(.Error(error))
        })
    }
    
    func forgotPassword(email: String) {
        
    }
    
    func signUp(name: String, email: String, password: String, completionBlock: @escaping (ResponseResult) -> ()) {
        let user = SignUpUser(name: name, email: email, password: password)
        let requestBody = SignUpRequestBody(payload: user)
        
        networkManager.request(target: .signUp(body: requestBody), success: { (response) in
            do
            {
                let response = try JSONDecoder().decode(AuthResponse.self, from: response.data)
                let currentUser = UserModel()
                currentUser.email = email
                currentUser.fullName = name
                currentUser.sessionToken = response.payload.sessionToken
                
                self.realmManager.saveObjects(objects: [currentUser], errorBlock: { (error) in
                    if let error = error {
                        completionBlock(.Error(error))
                    }
                })
                
                completionBlock(.Success)
            }
            catch let error {
                completionBlock(.Error(error))
            }
        }, error: { (error) in
            completionBlock(.Error(error))
        })
    }
    
    func logOut(completionBlock: @escaping (ResponseResult) -> ()) {
        guard let userToken = realmManager.getObjects(with: UserModel.self)?.first?.sessionToken
        else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Authentication error"])
            completionBlock(.Error(error))
            return
        }
        
        // TODO: sync all operation
        
        GIDSignIn.sharedInstance().signOut()
        
        networkManager.request(target: .logOut(token: userToken), success: { (response) in
            do
            {
                let _ = try JSONDecoder().decode(AuthResponse.self, from: response.data)
                completionBlock(.Success)
            }
            catch let error {
                completionBlock(.Error(error))
            }
        }, error: { (error) in
            completionBlock(.Success)
        })
    }
    
    func synchronize(completionBlock: @escaping (ResponseResult) -> ()) {
        // TODO: - sync all data
        completionBlock(.Success)
    }
}
