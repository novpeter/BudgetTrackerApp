//
//  MainScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 25/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class MainScreenView: UIView {
    
    lazy var dateFormatter = DateFormatter()
    
    
    // MARK: - Navigation bar
    
    lazy var profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profileButtonWhite"), for: .normal)
        profileButton.frame = UIConstants.navigationBarButtonFrame
        return profileButton
    }()
    
    lazy var datePicker: MonthYearPickerView = {
        let picker = MonthYearPickerView()
        picker.backgroundColor = .white
        picker.onDateSelected = { (month: Int, year: Int) in
            let months = self.dateFormatter.shortMonthSymbols
            let monthSymbol = months![month-1]
            self.dateTextField.text = "\(monthSymbol), \(year)"
        }
        return picker
    }()
    
    lazy var dateToolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = .white
        toolbar.tintColor = .black
        toolbar.isTranslucent = true
        return toolbar
    }()
    
    lazy var dateTextField: UITextField = {
        let textField = UITextField()
        let months = self.dateFormatter.shortMonthSymbols
        let monthSymbol = months![datePicker.month-1]
        textField.font = Fonts.poppinsMedium16
        textField.textColor = .white
        textField.text = "\(monthSymbol), \(datePicker.year)"
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
        label.textColor = .white
        label.font = Fonts.poppinsBold32
        label.textAlignment = .right
        label.text = MainScreenMock.income
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
        label.textColor = .white
        label.font = Fonts.poppinsBold32
        label.textAlignment = .right
        label.text = MainScreenMock.expense
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
        label.textColor = .white
        label.font = Fonts.poppinsMedium16
        label.textAlignment = .center
        label.text = Titles.difference
        return label
    }()
    
    lazy var differenceTotalLabel: UILabel = {
        let label = UILabel()
        label.textColor = TextColors.green  
        label.font = Fonts.poppinsMedium16
        label.textAlignment = .center
        label.text = MainScreenMock.difference
        return label
    }()
    
    lazy var differenceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [differenceLabel, differenceTotalLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeExpenseStackView, differenceStackView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = BackgroundColors.blue
        return view
    }()
    
    lazy var lastOperationsLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.poppinsMedium16
        label.textColor = .black
        label.text = Titles.lastOperations
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(OperationCell.self, forCellReuseIdentifier: UIConstants.cellIdentifier)
        return tableView
    }()
    
    lazy var tableViewStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lastOperationsLabel, tableView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 18
        return stackView
    }()
    
    lazy var showAddingScreenButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 32
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.backgroundColor = ButtonColors.blue
        button.tintColor = .white
        button.titleLabel?.font = Fonts.poppinsLight48
        button.setTitle("+", for: .normal)
        return button
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
        infoView.addSubview(infoStackView)
        scrollView.addSubview(infoView)
        scrollView.addSubview(tableViewStack)
        addSubview(scrollView)
        addSubview(showAddingScreenButton)
    }
    
    private func addConstraints() {
        
        dateTextField.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
        
        showAddingScreenButton.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.bottom.equalToSuperview().inset(24)
            make.right.equalTo(self.snp_right).inset(24)
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        infoView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp_top)
            make.width.equalTo(scrollView)
            make.centerX.equalTo(scrollView)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.center.equalTo(infoView)
            make.top.equalTo(infoView.snp.top).inset(28)
        }

        incomeExpenseStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }

        incomeIcon.snp.makeConstraints { make in
            make.height.width.equalTo(36)
        }
        
        incomeStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }

        expenseIcon.snp.makeConstraints { make in
            make.height.equalTo(incomeIcon)
            make.width.equalTo(incomeIcon)
        }
        
        expenseStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        differenceStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        lastOperationsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(tableView.contentSize.height)
        }
        
        tableViewStack.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp_bottom).offset(18)
            make.leading.trailing.bottom.equalToSuperview().inset(18)
        }
    }
}
