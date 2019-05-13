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
    var operationsManager: OperationsManagerProtocol!
    
    
    func signIn(email: String?, password: String?) {
        guard let email = email?.lowercased(), let password = password else { return }
        
        if !email.regex(mask: Regex.email) {
            presenter.showAlert(title: .wrongEmail, subTitle: .empty, alertType: .error)
            return
        }
        
        if !password.regex(mask: Regex.password) {
            presenter.showAlert(title: .wrongPassword, subTitle: .passwordReciepe, alertType: .error)
            return
        }
        
        presenter.startLoading()
        
        authService.signIn(email: email, password: password) { result in
            switch result {
            case .success:
                self.fetchAllOperations()
            case .error(let error):
                print("Sign in error: \(error.localizedDescription)")
                self.presenter.stopLoading()
                self.presenter.showAlert(title: .genericError, subTitle: .signInError, alertType: .error)
            }
        }
    }
    
    func googleSignIn(token: String, email: String, fullName: String) {
        presenter.startLoading()
        authService.googleSignIn(token: token, email: email, fullName: fullName) { result in
            switch result {
            case .success:
                self.fetchAllOperations()
            case .error(let error):
                print("Sign in error: \(error.localizedDescription)")
                self.presenter.stopLoading()
                self.presenter.showAlert(title: .genericError, subTitle: .signInError, alertType: .error)
            }
        }
    }
    
    private func fetchAllOperations() {
        operationsManager.fetchAllOperations { result in
            self.presenter.stopLoading()
            switch result {
            case .success,
                 .parseError,
                 .error:
                self.presenter.showMainScreen()
            case .readingError(let error):
                print("Reading error: \(error.localizedDescription)")
            default:
                break
            }
        }
    }
    
    func forgotPassword(email: String?) {
        guard let email = email, email.regex(mask: Regex.email) else {
            presenter.showAlert(title: .wrongEmail, subTitle: .empty, alertType: .error)
            return
        }
        
        // send password to email
        
        presenter.showAlert(title: .done, subTitle: .passwordWasSent, alertType: .success)
    }
}
