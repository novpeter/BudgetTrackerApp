//
//  WelcomeScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SnapKit

class WelcomeScreenView: UIView {
    
    // MARK: - Components
    
    lazy var topLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .left
        label.text = Titles.appNameTopPart
        label.font = Fonts.poppinsBold48
        label.textColor = .black
        return label
    }()
    
    lazy var bottomLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .right
        label.text = Titles.appNameBottomPart
        label.font = Fonts.poppinsBold48
        label.textColor = .black
        return label
    }()
    
    lazy var labelsStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [topLabel, bottomLabel])
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        return stackView
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
        button.setTitle(ButtonTitles.signIn, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Fonts.poppinsSemiBold16
        button.backgroundColor = ButtonColors.blue
        return button
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
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signUpButton, signInButton])
        stackView.axis = .vertical
        stackView.spacing = 20
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
        backgroundColor = .white
        addSubview(labelsStackView)
        addSubview(buttonsStackView)
    }
    
    private func addConstraints() {
        
        labelsStackView.snp.makeConstraints({ make in
            make.left.right.equalToSuperview().inset(64)
            make.top.equalToSuperview().inset(90)
            make.height.lessThanOrEqualTo(140)
        })
        
        buttonsStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(48)
            make.bottom.equalToSuperview().inset(90)
        }
        
        signInButton.snp.makeConstraints { make in
            make.centerX.equalTo(buttonsStackView)
            make.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
}
