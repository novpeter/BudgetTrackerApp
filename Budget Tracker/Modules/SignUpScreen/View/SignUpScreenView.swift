//
//  SignInScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 11/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SnapKit

class SignUpScreenView: UIView {
    
    // MARK: - Components
    
    lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        backButton.frame = UIConstants.navigationBarButtonFrame
        return backButton
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.placeholder = Placeholders.name
        textField.font = Fonts.poppinsMedium16
        textField.textColor = .black
        textField.tintColor = TextColors.gray
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.placeholder = Placeholders.email
        textField.font = Fonts.poppinsMedium16
        textField.textColor = .black
        textField.tintColor = TextColors.gray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.placeholder = Placeholders.password
        textField.font = Fonts.poppinsMedium16
        textField.textColor = .black
        textField.tintColor = TextColors.gray
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.placeholder = Placeholders.confirmPassword
        textField.font = Fonts.poppinsMedium16
        textField.textColor = .black
        textField.tintColor = TextColors.gray
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = UIConstants.buttonCornerRadius
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 10)
        button.layer.shadowOpacity = UIConstants.buttonShadowOpacity
        button.layer.shadowRadius = UIConstants.buttonShadowRadius
        button.layer.masksToBounds = false
        button.setTitle(ButtonTitles.signUp, for: .normal)
        button.setTitleColor(TextColors.gray, for: .normal)
        button.titleLabel?.font = Fonts.poppinsSemiBold16
        button.backgroundColor = .white
        return button
    }()
    
    lazy var mainStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [
            nameTextField,
            emailTextField,
            passwordTextField,
            confirmPasswordTextField,
            signUpButton
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var scrollView: UIScrollView = {
       return UIScrollView()
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
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(mainStackView)
    }
    
    private func addConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.center.edges.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(48)
            make.top.equalToSuperview().inset(44)
            make.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalTo(mainStackView)
            make.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(mainStackView)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalTo(mainStackView)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(mainStackView)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(mainStackView)
        }
    }
}
