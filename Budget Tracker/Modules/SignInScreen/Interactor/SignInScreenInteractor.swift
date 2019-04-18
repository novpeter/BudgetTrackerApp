//
//  SignInScreenInteractor.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SCLAlertView

class SignInScreenInteractor: SignInScreenInteractorInput {
    
    var presenter: SignInScreenInteractorOutput!
    
    
    func signIn(email: String?, password: String?) {
        guard let email = email?.lowercased(), let password = password else { return }
        
        if !email.regex(mask: Regex.Email) {
            presenter.showAlert(title: AlertTitles.WrongEmail, description: "", alertType: .error)
            return
        }
        
        if !password.regex(mask: Regex.Password) {
            presenter.showAlert(title: AlertTitles.WrongPassword, description: AlertTitles.PasswordReciepe, alertType: .error)
            return
        }
        
//        let user = SignInUser(fullName: nil, email: email, token: nil, password: password)
//        let requestBody = SignInRequestBody(authType: AuthType.Regular, payload: user)
//        
//        NetworkManager.request(target: .signIn(body: requestBody), success: { (response) in
//
//            do
//            {
//                let response = try JSONDecoder().decode(AuthResponse.self, from: response.data)
//                print("TOKEN: \(response.payload.sessionToken)")
//            }
//            catch {
//
//            }
//
//        }, error: { (error) in
//            print(error.localizedDescription)
//        }, failure: { (error) in
//            print(error.localizedDescription)
//        })
        presenter.showMainScreen()
        
    }
    
    func googleSignIn(accountId: String, token: String, email: String, fullName: String) {
        
        // запрос серверу на вход через гугл аккаунт
        
        presenter.showMainScreen()
    }
    
    func forgotPassword(email: String?) {
        guard let email = email, email.regex(mask: Regex.Email) else {
            presenter.showAlert(title: AlertTitles.WrongEmail, description: "", alertType: .error)
            return
        }
        
        // send password to email
        
        presenter.showAlert(title: AlertTitles.Done, description: "\(AlertTitles.PasswordWasSent)\(email)", alertType: .success)
    }
}
