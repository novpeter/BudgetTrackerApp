//
//  LogInScreenInteractor.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SCLAlertView

class LogInScreenInteractor: LogInScreenInteractorInput {
    
    var authorizationService: AuthorizationService!
    var presenter: LogInScreenInteractorOutput!
    
    
    func logIn(email: String?, password: String?) {
        guard let email = email, let password = password else { return }
        
        if !email.regex(mask: Regex.Email) {
            presenter.showAlert(title: AlertTitles.WrongEmail, description: "", alertType: .error)
            return
        }
        
        if !password.regex(mask: Regex.Password) {
            presenter.showAlert(title: AlertTitles.WrongPassword, description: AlertTitles.PasswordReciepe, alertType: .error)
            return
        }
        
        // запрос серверу на вход
    }
    
    func googleLogIn(accountId: String, token: String, email: String, fullName: String) {
        
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
