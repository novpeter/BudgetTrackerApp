//
//  SignUpScreenInteractor.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class SignUpScreenInteractor: SignUpScreenInteractorInput {
    
    var presenter: SignUpScreenInteractorOutput!
    
    
    func signUp(name: String?, email: String?, password: String?, confirmedPassword: String?) {
        guard let name = name, let email = email, let password = password, let confirmedPassword = confirmedPassword
            else { return }
        
        if name.count < 3 {
            presenter.showAlert(title: AlertTitles.WrongName, description: "", alertType: .error)
            return
        }
        
        if !email.regex(mask: Regex.Email) {
            presenter.showAlert(title: AlertTitles.WrongEmail, description: "", alertType: .error)
            return
        }
        
        if !password.regex(mask: Regex.Password) {
            presenter.showAlert(title: AlertTitles.WrongPassword, description: AlertTitles.PasswordReciepe, alertType: .error)
            return
        }
        
        if password != confirmedPassword {
            presenter.showAlert(title: AlertTitles.WrongPassword, description: AlertTitles.PasswordsNotMatch, alertType: .error)
            return
        }
        
        // запрос серверу на регистрацию и получение токена
    }
}
