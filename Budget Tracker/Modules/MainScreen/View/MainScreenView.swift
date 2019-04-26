//
//  MainScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 25/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class MainScreenView: UIView {
    
    // MARK: - Components
    
    lazy var profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profileButtonBlack"), for: .normal)
        profileButton.frame = UIConstants.navigationBarBattonFrame
        return profileButton
    }()
    
    lazy var statisticButton: UIButton = {
        let statisticButton = UIButton()
        statisticButton.setImage(UIImage(named: "statisticButtonBlack"), for: .normal)
        statisticButton.frame = UIConstants.navigationBarBattonFrame
        return statisticButton
    }()
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    lazy var dateToolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        return toolbar
    }()
    
    lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.font = Fonts.PoppinsMedium16
        textField.textColor = TextColors.Black
        textField.text = "April 2019"
        textField.textAlignment = .center
        textField.inputAccessoryView = dateToolBar
        textField.inputView = datePicker
        return textField
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
    }
    
    private func addConstraints() {
        
        dateTextField.snp.makeConstraints { (make) in
            make.width.equalTo(120)
        }
    }
}
