//
//  SignUpScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class SignUpScreenViewController: UIViewController {
    
    var presenter: SignUpScreenViewOutput!
    
    override func loadView() {
        super.loadView()
        
        let view = SignUpScreenView()
        view.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
 
    // MARK: - Button's handlers
    
    @objc func signUpButtonClicked(sender: UIButton) {
        sender.pulsate()
        
        guard let view = self.view as? SignUpScreenView else { return }
        
        let name = view.nameTextField.text
        let email = view.emailTextField.text
        let password = view.passwordTextField.text
        let confirmedPassword = view.confirmPasswordTextField.text
        
        presenter.signUpButtonClicked(name: name, email: email, password: password, confirmedPassword: confirmedPassword)
    }
    
}

extension SignUpScreenViewController: SignUpScreenViewInput {
    
}
