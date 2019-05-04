//
//  SignUpScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class SignUpScreenViewController: UIViewController, UITextFieldDelegate {
    
    var presenter: SignUpScreenViewOutput!
    
    lazy var contentView = SignUpScreenView()
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.nameTextField.delegate = self
        contentView.emailTextField.delegate = self
        contentView.passwordTextField.delegate = self
        contentView.confirmPasswordTextField.delegate = self
        
        configureNavigationBar()
        configureKeyboardObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func addTargets() {
        contentView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        contentView.backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.backButton)
    }
   
    
    // MARK: - Keyboard observers
    
    private func configureKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.showKeyboard(notification: notification)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.hideKeyboard()
        }
    }
    
    @objc private func showKeyboard(notification: Notification) {
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        contentView.scrollView.contentInset.bottom = keyboardFrame.size.height
        contentView.scrollView.scrollIndicatorInsets = contentView.scrollView.contentInset
    }
    
    @objc private func hideKeyboard() {
        contentView.scrollView.contentInset = .zero
        contentView.scrollView.scrollIndicatorInsets = contentView.scrollView.contentInset
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
    
    @objc func onClickBack(){
        navigationController?.popViewController(animated: true)
    }
}

extension SignUpScreenViewController: SignUpScreenViewInput {
    
}
