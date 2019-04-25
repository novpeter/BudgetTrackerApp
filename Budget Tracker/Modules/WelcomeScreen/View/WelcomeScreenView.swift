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
        label.text = Titles.AppNameTopPart
        label.font = Fonts.PoppinsBold48
        label.textColor = TextColors.Black
        return label
    }()
    
    lazy var bottomLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .right
        label.text = Titles.AppNameBottomPart
        label.font = Fonts.PoppinsBold48
        label.textColor = TextColors.Black
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
        button.layer.cornerRadius = 15.0
        button.layer.borderWidth = 0.15
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 10)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 10.0
        button.layer.masksToBounds = false
        button.setTitle(ButtonTitles.SignIn, for: .normal)
        button.setTitleColor(TextColors.White, for: .normal)
        button.titleLabel?.font = Fonts.PoppinsSemiBold16
        button.backgroundColor = ButtonColors.Blue
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15.0
        button.layer.borderWidth = 0.15
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 10)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 10.0
        button.layer.masksToBounds = false
        button.setTitle(ButtonTitles.SignUp, for: .normal)
        button.setTitleColor(TextColors.Grey, for: .normal)
        button.titleLabel?.font = Fonts.PoppinsSemiBold16
        button.backgroundColor = ButtonColors.White
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
        self.backgroundColor = .white
        self.addSubview(labelsStackView)
        self.addSubview(buttonsStackView)
    }
    
    private func addConstraints() {
        
        labelsStackView.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(64)
            make.right.equalTo(self).offset(-64)
            make.top.equalTo(self).offset(120)
            make.height.lessThanOrEqualTo(140)
        })
        
        buttonsStackView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(48)
            make.right.equalTo(self).offset(-48)
            make.bottom.equalTo(self).offset(-120)
        }
        
        signInButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(buttonsStackView)
            make.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.centerX.equalTo(buttonsStackView)
        }
    }
}
