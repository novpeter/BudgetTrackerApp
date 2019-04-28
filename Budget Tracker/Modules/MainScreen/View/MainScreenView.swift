//
//  MainScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 25/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class MainScreenView: UIView {
    
    // MARK: - Navigation bar
    
    lazy var profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profileButtonWhite"), for: .normal)
        profileButton.frame = UIConstants.navigationBarBattonFrame
        return profileButton
    }()
    
    lazy var statisticButton: UIButton = {
        let statisticButton = UIButton()
        statisticButton.setImage(UIImage(named: "statisticButtonWhite"), for: .normal)
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
        textField.textColor = TextColors.White
        textField.text = "April 2019"
        textField.textAlignment = .center
        textField.inputAccessoryView = dateToolBar
        textField.inputView = datePicker
        return textField
    }()
    
    
    // MARK: - Components
    
    lazy var incomeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "incomeIcon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var incomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = TextColors.White
        label.font = Fonts.PoppinsBold32
        label.textAlignment = .right
        label.text = "120650 " + Currency.Rubble
        return label
    }()
    
    lazy var incomeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeIcon, incomeLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var expenseIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "expenseIcon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var expenseLabel: UILabel = {
        let label = UILabel()
        label.textColor = TextColors.White
        label.font = Fonts.PoppinsBold32
        label.textAlignment = .right
        label.text = "32450 " + Currency.Rubble
        return label
    }()
    
    lazy var expenseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [expenseIcon, expenseLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var incomeExpenseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeStackView, expenseStackView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 1
        return stackView
    }()
    
    lazy var differenceLabel: UILabel = {
        let label = UILabel()
        label.textColor = TextColors.White
        label.font = Fonts.PoppinsMedium16
        label.textAlignment = .center
        label.text = Titles.Difference
        return label
    }()
    
    lazy var differenceTotalLabel: UILabel = {
        let label = UILabel()
        label.textColor = TextColors.Green
        label.font = Fonts.PoppinsMedium16
        label.textAlignment = .center
        label.text = "88200 "  + Currency.Rubble
        return label
    }()
    
    lazy var differenceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [differenceLabel, differenceTotalLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeExpenseStackView, differenceStackView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 12
        
        stackView.backgroundColor = .red
        
        return stackView
    }()
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = BackgroundColors.Blue
        view.addSubview(infoStackView)
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = BackgroundColors.White
        scrollView.addSubview(infoView)
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
        self.addSubview(scrollView)
    }
    
    private func addConstraints() {
        
        dateTextField.snp.makeConstraints { (make) in
            make.width.equalTo(120)
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        infoView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp_top)
            make.width.equalTo(scrollView)
            make.centerX.equalTo(scrollView)
        }
        
        infoStackView.snp.makeConstraints { (make) in
            make.center.equalTo(infoView)
            make.top.equalTo(infoView).offset(28)
        }

        incomeExpenseStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
        }

        incomeIcon.snp.makeConstraints { (make) in
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
        
        incomeStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
        }

        expenseIcon.snp.makeConstraints { (make) in
            make.height.equalTo(incomeIcon)
            make.width.equalTo(incomeIcon)
        }
        
        expenseStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
        }
        
        differenceStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
        }
    }
}