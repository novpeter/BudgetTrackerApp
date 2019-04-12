//
//  LogInScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import GoogleSignIn

class LogInScreenViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var presenter: LogInScreenViewOutput!
    
    override func loadView() {
        super.loadView()
        
        let view = LogInScreenView()
        
        let googleCredentials = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "credentials", ofType: "plist")!)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().clientID = googleCredentials!["CLIENT_ID"] as? String
        
        view.logInButton.addTarget(self, action: #selector(logInButtonClicked), for: .touchUpInside)
        view.googleLogInButton.addTarget(self, action: #selector(googleLogInButtonClicked), for: .touchUpInside)
        view.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonClicked), for: .touchUpInside)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    // MARK: - Button's handlers
    
    @objc private func logInButtonClicked(sender: UIButton) {
        sender.pulsate()
        
        guard let view = self.view as? LogInScreenView else { return }
        let email = view.emailTextField.text
        let password = view.passwordTextField.text

        presenter.logInButtonClicked(email: email, password: password)
    }
    
    
    @objc private func forgotPasswordButtonClicked(sender: UIButton) {
        sender.pulsate()
        
        guard let view = self.view as? LogInScreenView else { return }
        let email = view.emailTextField.text
        
        presenter.forgotPasswordButtonClicked(email: email)
    }
    
    
    // MARK: - Google auth
   
    @objc private func googleLogInButtonClicked(sender: UIButton) {
        sender.pulsate()
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Google authorization error: \(error.localizedDescription)")
        }
        else {
            presenter.googleLogInButtonClicked(
                accountId: user.userID,
                token: user.authentication.idToken,
                email: user.profile.email,
                fullName: user.profile.name)
        }
    }
}

extension LogInScreenViewController: LogInScreenViewInput {
    
}
