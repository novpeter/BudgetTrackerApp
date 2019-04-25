//
//  SignInScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 11/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SnapKit

class SignInScreenView: UIView {
    
    // MARK: - Components
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.placeholder = Placeholders.Email
        textField.font = Fonts.PoppinsMedium16
        textField.textColor = TextColors.Black
        textField.tintColor = TextColors.Grey
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.placeholder = Placeholders.Password
        textField.font = Fonts.PoppinsMedium16
        textField.textColor = TextColors.Black
        textField.tintColor = TextColors.Grey
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.distribution = .fillEqually
        return stackView
    }()

    lazy var googleSignInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = UIConstants.buttonCornerRadius
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 10)
        button.layer.shadowOpacity = UIConstants.buttonShadowOpacity
        button.layer.shadowRadius = UIConstants.buttonShadowRadius
        button.layer.masksToBounds = false
        button.setTitle(ButtonTitles.GoogleSignIn, for: .normal)
        button.setTitleColor(TextColors.Grey, for: .normal)
        button.setImage(UIImage(named: "google"), for: .normal)
        button.titleLabel?.font = Fonts.PoppinsSemiBold16
        button.backgroundColor = ButtonColors.White
        return button
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = UIConstants.buttonCornerRadius
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 10)
        button.layer.shadowOpacity = UIConstants.buttonShadowOpacity
        button.layer.shadowRadius = UIConstants.buttonShadowRadius
        button.layer.masksToBounds = false
        button.setTitle(ButtonTitles.SignIn, for: .normal)
        button.setTitleColor(TextColors.White, for: .normal)
        button.titleLabel?.font = Fonts.PoppinsSemiBold16
        button.backgroundColor = ButtonColors.Blue
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0
        button.layer.masksToBounds = false
        button.setTitle(ButtonTitles.ForgotPassword, for: .normal)
        button.setTitleColor(TextColors.Blue, for: .normal)
        button.titleLabel?.font = Fonts.PoppinsBold12
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleSignInButton, signInButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textFieldsStackView, buttonsStackView])
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubviews()
        addConstraints()
    }
    
    
    // MARK: - Congigurating
    
    private func addSubviews() {
        self.backgroundColor = .white
        self.addSubview(mainStackView)
        self.addSubview(forgotPasswordButton)
    }
    
    private func addConstraints() {
        
        mainStackView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(48)
            make.right.equalTo(self).offset(-48)
            make.top.equalTo(self).offset(44)
        }
        
        signInButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(buttonsStackView)
            make.height.equalTo(50)
        }
        
        googleSignInButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(buttonsStackView)
            make.height.equalTo(50)
        }
        
        googleSignInButton.imageEdgeInsets.right = 40.0
        
        forgotPasswordButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(mainStackView).offset(40)
            make.centerX.equalTo(self)
            make.height.equalTo(20)
            make.width.equalTo(120)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(textFieldsStackView)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(textFieldsStackView)
        }
    }
}
