//
//  SignInScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInScreenViewController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var presenter: SignInScreenViewOutput!
    
    lazy var contentView = SignInScreenView()
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
        connectGoogleSignIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.emailTextField.delegate = self
        contentView.passwordTextField.delegate = self
        
        configureNavigationBar()
    }
    
    private func addTargets() {
        contentView.signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
        contentView.googleSignInButton.addTarget(self, action: #selector(googleSignInButtonClicked), for: .touchUpInside)
        contentView.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonClicked), for: .touchUpInside)
        contentView.backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
    }
    
    private func connectGoogleSignIn() {
        let googleCredentials = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "credentials", ofType: "plist")!)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().clientID = googleCredentials!["CLIENT_ID"] as? String
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.backButton)
    }
    
    
    // MARK: - Keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK: - Button's handlers
    
    @objc
    private func signInButtonClicked(sender: UIButton) {
        sender.pulsate()
        
        let email = contentView.emailTextField.text
        let password = contentView.passwordTextField.text
        presenter.signInButtonClicked(email: email, password: password)
    }
    
    @objc
    private func forgotPasswordButtonClicked(sender: UIButton) {
        sender.pulsate()
        
        let email = contentView.emailTextField.text
        presenter.forgotPasswordButtonClicked(email: email)
    }
    
    @objc
    func onClickBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Google auth
    
    @objc
    private func googleSignInButtonClicked(sender: UIButton) {
        sender.pulsate()
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Google authorization error: \(error.localizedDescription)")
        }
        else {
            presenter.googleSignInButtonClicked(
                token: user.authentication.idToken,
                email: user.profile.email,
                fullName: user.profile.name)
        }
    }
}

extension SignInScreenViewController: SignInScreenViewInput {
    
}
