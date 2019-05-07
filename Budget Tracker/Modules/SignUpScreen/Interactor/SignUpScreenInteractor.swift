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
    var authService: AuthServiceProtocol!
    
    func signUp(name: String?, email: String?, password: String?, confirmedPassword: String?) {
        guard let name = name, let email = email?.lowercased(), let password = password, let confirmedPassword = confirmedPassword
        else {
            presenter.showAlert(title: .genericError, subTitle: .checkAllFields, alertType: .error)
            return
        }
        if name.count < 3 {
            presenter.showAlert(title: .wrongName, subTitle: .empty, alertType: .error)
            return
        }
        if !email.regex(mask: Regex.email) {
            presenter.showAlert(title: .wrongEmail, subTitle: .empty, alertType: .error)
            return
        }
        if !password.regex(mask: Regex.password) {
            presenter.showAlert(title: .wrongPassword, subTitle: .passwordReciepe, alertType: .error)
            return
        }
        if password != confirmedPassword {
            presenter.showAlert(title: .wrongPassword, subTitle: .passwordsNotMatch, alertType: .error)
            return
        }
        
        presenter.startLoading()
        
        authService.signUp(name: name, email: email, password: password) { result in
            self.presenter.stopLoading()
            switch result {
            case .Success:
                self.presenter.showMainScreen()
            case .Error(let error):
                print("Sign up error: \(error.localizedDescription)")
                self.presenter.showAlert(title: .genericError, subTitle: .signUpError, alertType: .error)
            }
        }
    }
}
