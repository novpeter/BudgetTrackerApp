//
//  AddingScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 02/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class AddingScreenView: UIView {
    
    private let appearance = Appearance()
    
    // MARK: - Components
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.getImage(.CloseButtonIcon)(), for: .normal)
        button.frame = UIConstants.navigationBarButtonFrame
        return button
    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.textAlignment = .left
        textField.placeholder = Placeholders.Title
        textField.font = Fonts.PoppinsBold20
        textField.textColor = TextColors.Black
        textField.tintColor = TextColors.Grey
        return textField
    }()
    
    lazy var commentTextView: UITextView = {
        let textView = UITextView()
        textView.keyboardType = .default
        textView.text = Placeholders.Comment
        textView.font = Fonts.PoppinsMedium16
        textView.textColor = TextColors.Grey
        textView.tintColor = TextColors.Grey
        textView.tag = 1
        return textView
    }()
    
    lazy var categoryIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Categories.getCategoryIcon(.Other)
        return imageView
    }()
    
    lazy var categoryTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.font = Fonts.PoppinsMedium16
        textField.textColor = TextColors.Black
        textField.text = Categories.Other.rawValue
        textField.inputView = categoryPicker
        textField.inputAccessoryView = categoryToolBar
        return textField
    }()
    
    lazy var categoryToolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = BackgroundColors.White
        toolbar.tintColor = TextColors.Black
        toolbar.isTranslucent = true
        return toolbar
    }()
    
    lazy var categoryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = BackgroundColors.White
        return picker
    }()
    
    lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryIcon, categoryTextField])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = appearance.categoryStackViewSpacing
        return stackView
    }()
    
    lazy var dateIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.getImage(.CalendarIcon)()
        return imageView
    }()
    
    lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.font = Fonts.PoppinsMedium16
        textField.textColor = TextColors.Black
        textField.inputView = datePicker
        textField.inputAccessoryView = dateToolBar
        return textField
    }()
    
    lazy var dateToolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = BackgroundColors.White
        toolbar.tintColor = TextColors.Black
        toolbar.isTranslucent = true
        return toolbar
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = BackgroundColors.White
        return datePicker
    }()
    
    lazy var dateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateIcon, dateTextField])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = appearance.dateStackViewSpacing
        return stackView
    }()
    
    lazy var sumTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .phonePad
        textField.textAlignment = .center
        textField.placeholder = Placeholders.ZeroSum
        textField.font = Fonts.PoppinsMedium48
        textField.textColor = TextColors.Black
        textField.tintColor = TextColors.Grey
        return textField
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = UIConstants.buttonCornerRadius
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.shadowColor = UIConstants.buttonShadowColor
        button.layer.shadowOffset = UIConstants.buttonShadowOffset
        button.layer.shadowOpacity = UIConstants.buttonShadowOpacity
        button.layer.shadowRadius = UIConstants.buttonShadowRadius
        button.layer.masksToBounds = false
        button.setTitle(ButtonTitles.Add, for: .normal)
        button.setTitleColor(TextColors.White, for: .normal)
        button.titleLabel?.font = Fonts.PoppinsSemiBold16
        button.backgroundColor = ButtonColors.Blue
        return button
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
                titleTextField,
                commentTextView,
                categoryStackView,
                dateStackView,
                sumTextField,
                addButton
            ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = appearance.mainStackViewSpacing
        return stackView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = BackgroundColors.White
        return scrollView
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
        addSubview(scrollView)
        scrollView.addSubview(mainStackView)
    }
    
    private func addConstraints() {
    
        scrollView.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        mainStackView.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(scrollView.snp_top).offset(appearance.mainStackViewVerticalConstraint)
            make.bottom.greaterThanOrEqualTo(scrollView.snp_bottom).offset(appearance.mainStackViewVerticalConstraint)
            make.leading.equalToSuperview().inset(appearance.mainStackViewHorizontalConstraint)
            make.trailing.equalToSuperview().offset(appearance.mainStackViewHorizontalConstraint)
        }
        
        titleTextField.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(appearance.titleTextFieldHeight)
        }
        
        commentTextView.snp_makeConstraints { (make) in
            make.height.equalTo(appearance.commentTextViewHeight)
            make.centerX.equalToSuperview()
        }
        
        dateIcon.snp_makeConstraints { (make) in
            make.height.width.equalTo(appearance.iconHeightWidth)
        }
        
        categoryIcon.snp_makeConstraints { (make) in
            make.height.width.equalTo(appearance.iconHeightWidth)
        }
        
        addButton.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(UIConstants.buttonHeight)
        }
    }
}

extension AddingScreenView {
    
    fileprivate struct Appearance {
        let categoryStackViewSpacing: CGFloat = 16
        
        let dateStackViewSpacing: CGFloat = 16
        
        let mainStackViewVerticalConstraint = 32
        let mainStackViewHorizontalConstraint = 40
        let mainStackViewSpacing: CGFloat = 28
        
        let iconHeightWidth = 24
        
        let titleTextFieldHeight: CGFloat = 35
        let commentTextViewHeight: CGFloat = 70
    }
}

