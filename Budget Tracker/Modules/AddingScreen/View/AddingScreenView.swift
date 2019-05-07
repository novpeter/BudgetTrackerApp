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
        button.setImage(Images.getImage(.closeButtonIcon), for: .normal)
        button.frame = UIConstants.navigationBarButtonFrame
        return button
    }()
    
    lazy var operationTypeSegmentedControl: OperationTypeSegmentedControl = {
        let segmentedControl = OperationTypeSegmentedControl()
        segmentedControl.layer.shadowColor = UIConstants.buttonShadowColor
        segmentedControl.layer.shadowOffset = UIConstants.buttonShadowOffset
        segmentedControl.layer.shadowOpacity = UIConstants.buttonShadowOpacity
        segmentedControl.layer.shadowRadius = UIConstants.buttonShadowRadius
        return segmentedControl
    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.textAlignment = .left
        textField.placeholder = Placeholders.title
        textField.font = Fonts.poppinsBold20
        textField.textColor = .black
        textField.tintColor = TextColors.gray
        return textField
    }()
    
    lazy var commentTextView: UITextView = {
        let textView = UITextView()
        textView.keyboardType = .default
        textView.text = Placeholders.comment
        textView.font = Fonts.poppinsMedium16
        textView.textColor = TextColors.gray
        textView.tintColor = TextColors.gray
        textView.tag = 1
        return textView
    }()
    
    lazy var categoryIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Categories.getCategoryIcon(.other)
        return imageView
    }()
    
    lazy var categoryTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.font = Fonts.poppinsMedium16
        textField.textColor = .black
        textField.text = Categories.other.rawValue
        textField.inputView = categoryPicker
        textField.inputAccessoryView = categoryToolBar
        return textField
    }()
    
    lazy var categoryToolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = .white
        toolbar.tintColor = .black
        toolbar.isTranslucent = true
        return toolbar
    }()
    
    lazy var categoryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        return picker
    }()
    
    lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryIcon, categoryTextField])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = appearance.stackViewSpacing
        return stackView
    }()
    
    lazy var dateIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.getImage(.calendarIcon)
        return imageView
    }()
    
    lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.font = Fonts.poppinsMedium16
        textField.textColor = .black
        textField.inputView = datePicker
        textField.inputAccessoryView = dateToolBar
        return textField
    }()
    
    lazy var dateToolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = .white
        toolbar.tintColor = .black
        toolbar.isTranslucent = true
        return toolbar
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        return datePicker
    }()
    
    lazy var dateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateIcon, dateTextField])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = appearance.stackViewSpacing
        return stackView
    }()
    
    lazy var sumTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .phonePad
        textField.textAlignment = .center
        textField.placeholder = Placeholders.zeroSum
        textField.font = Fonts.poppinsMedium48
        textField.textColor = .black
        textField.tintColor = TextColors.gray
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
        button.setTitle(ButtonTitles.add, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Fonts.poppinsSemiBold16
        button.backgroundColor = ButtonColors.blue
        return button
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
                operationTypeSegmentedControl,
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
        scrollView.backgroundColor = .white
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
    
        scrollView.snp_makeConstraints { make in
            make.center.edges.equalToSuperview()
        }
        
        mainStackView.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(scrollView.snp_top).inset(appearance.mainStackViewVerticalConstraint)
            make.bottom.greaterThanOrEqualTo(scrollView.snp_bottom).inset(appearance.mainStackViewVerticalConstraint)
            make.leading.trailing.equalToSuperview().inset(appearance.mainStackViewHorizontalConstraint)
        }
        
        operationTypeSegmentedControl.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        titleTextField.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        commentTextView.snp_makeConstraints { make in
            make.height.equalTo(appearance.commentTextViewHeight)
            make.centerX.equalToSuperview()
        }
        
        dateIcon.snp_makeConstraints { make in
            make.height.width.equalTo(appearance.iconSize)
        }
        
        categoryIcon.snp_makeConstraints { make in
            make.height.width.equalTo(appearance.iconSize)
        }
        
        addButton.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(UIConstants.buttonHeight)
        }
    }
}

extension AddingScreenView {
    
    fileprivate struct Appearance {
        let stackViewSpacing: CGFloat = 16
        
        let mainStackViewVerticalConstraint = 32
        let mainStackViewHorizontalConstraint = 40
        let mainStackViewSpacing: CGFloat = 28
        
        let iconSize = 24
        
        let commentTextViewHeight: CGFloat = 70
    }
}

