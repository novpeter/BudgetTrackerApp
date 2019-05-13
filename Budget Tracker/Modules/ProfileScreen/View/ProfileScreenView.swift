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
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.image = UIImage(named: "profilePlaceholder")
        return imageView
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.poppinsMedium16
        label.textColor = .black
        label.text = "example@gmail.com"
        return label
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, emailLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
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
        button.setTitle(ButtonTitles.synchronize, for: .normal)
        button.setTitleColor(TextColors.gray, for: .normal)
        button.titleLabel?.font = Fonts.poppinsSemiBold16
        button.backgroundColor = .white
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
        button.setTitle(ButtonTitles.logOut, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Fonts.poppinsSemiBold16
        button.backgroundColor = ButtonColors.red
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
        backgroundColor = .white
        addSubview(infoStackView)
        addSubview(buttonsStackView)
    }
    
    private func addConstraints() {
        
        infoStackView.snp.makeConstraints({ make in
            make.left.right.equalToSuperview().inset(64)
            make.top.equalToSuperview().inset(100)
        })
        
        profileImageView.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.width.lessThanOrEqualTo(120)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(48)
            make.bottom.equalToSuperview().inset(70)
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
