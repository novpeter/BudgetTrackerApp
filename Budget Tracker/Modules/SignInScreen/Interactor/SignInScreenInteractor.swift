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
    var authService: AuthServiceProtocol!
    
    
    func signIn(email: String?, password: String?) {
        guard let email = email?.lowercased(), let password = password else { return }
        
        if !email.regex(mask: Regex.Email) {
            presenter.showAlert(title: .WrongEmail, subTitle: .Empty, alertType: .error)
            return
        }
        
        if !password.regex(mask: Regex.Password) {
            presenter.showAlert(title: .WrongPassword, subTitle: .PasswordReciepe, alertType: .error)
            return
        }
        
        presenter.startLoading()
        
        authService.signIn(email: email, password: password) { result in
            self.presenter.stopLoading()
            switch result {
            case .Success:
                self.presenter.showMainScreen()
            case .Error(let error):
                print("Sign in error: \(error.localizedDescription)")
                self.presenter.showAlert(title: .GenericError, subTitle: .SignInError, alertType: .error)
            }
        }
    }
    
    func googleSignIn(token: String, email: String, fullName: String) {
        presenter.startLoading()
        authService.googleSignIn(token: token, email: email, fullName: fullName) { result in
            self.presenter.stopLoading()
            switch result {
            case .Success:
                self.presenter.showMainScreen()
            case .Error(let error):
                print("Sign in error: \(error.localizedDescription)")
                self.presenter.showAlert(title: AlertTitles.GenericError, subTitle: .SignInError, alertType: .error)
            }
        }
    }
    
    func forgotPassword(email: String?) {
        guard let email = email, email.regex(mask: Regex.Email) else {
            presenter.showAlert(title: AlertTitles.WrongEmail, subTitle: .Empty, alertType: .error)
            return
        }
        
        // send password to email
        
        presenter.showAlert(title: AlertTitles.Done, subTitle: .PasswordWasSent, alertType: .success)
    }
}
