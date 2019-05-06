//
//  ProfileScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 19/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class ProfileScreenView: UIView {
    
    // MARK: - Info stack view
    
    lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        backButton.frame = UIConstants.navigationBarButtonFrame
        return backButton
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 0.15
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profilePlaceholder")
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.PoppinsBold20
        label.textColor = TextColors.Black
        label.text = "Anton Ivanov"
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.PoppinsMedium16
        label.textColor = TextColors.Grey
        label.text = "petkacool1@gmail.com"
        return label
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, fullNameLabel, emailLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    // MARK: - Buttons stack view
    
    lazy var syncButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = UIConstants.buttonCornerRadius
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 10)
        button.layer.shadowOpacity = UIConstants.buttonShadowOpacity
        button.layer.shadowRadius = UIConstants.buttonShadowRadius
        button.layer.masksToBounds = false
        button.setTitle(ButtonTitles.Synchronize, for: .normal)
        button.setTitleColor(TextColors.Grey, for: .normal)
        button.titleLabel?.font = Fonts.PoppinsSemiBold16
        button.backgroundColor = ButtonColors.White
        return button
    }()
    
    lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = UIConstants.buttonCornerRadius
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 10)
        button.layer.shadowOpacity = UIConstants.buttonShadowOpacity
        button.layer.shadowRadius = UIConstants.buttonShadowRadius
        button.layer.masksToBounds = false
        button.setTitle(ButtonTitles.LogOut, for: .normal)
        button.setTitleColor(TextColors.White, for: .normal)
        button.titleLabel?.font = Fonts.PoppinsSemiBold16
        button.backgroundColor = ButtonColors.Red
        return button
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [syncButton, logOutButton])
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
        self.addSubview(infoStackView)
        self.addSubview(buttonsStackView)
    }
    
    private func addConstraints() {
        
        infoStackView.snp.makeConstraints({ make in
            make.left.equalTo(self).offset(64)
            make.right.equalTo(self).offset(-64)
            make.top.equalTo(self).offset(120)
        })
        
        profileImageView.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.width.lessThanOrEqualTo(120)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(48)
            make.right.equalTo(self).offset(-48)
            make.bottom.equalTo(self).offset(-120)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.centerX.equalTo(buttonsStackView)
            make.height.equalTo(50)
        }
        
        syncButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalTo(buttonsStackView)
        }
    }
}
