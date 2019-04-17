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
    
    lazy var contentView = SignUpScreenView()
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
    }
    
    private func addTargets() {
        contentView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
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
        
        let name = contentView.nameTextField.text
        let email = contentView.emailTextField.text
        let password = contentView.passwordTextField.text
        let confirmedPassword = contentView.confirmPasswordTextField.text
        
        presenter.signUpButtonClicked(name: name, email: email, password: password, confirmedPassword: confirmedPassword)
    }
    
}

extension SignUpScreenViewController: SignUpScreenViewInput {
    
}
