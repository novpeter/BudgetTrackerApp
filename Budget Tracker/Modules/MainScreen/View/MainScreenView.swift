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
    
    lazy var incomeCurrencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.poppinsBold32
        label.textAlignment = .center
        label.text = Currency.rubble
        return label
    }()
    
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
        label.text = "0.0"
        return label
    }()
    
    lazy var incomeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeIcon, incomeLabel, incomeCurrencyLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var expenseCurrencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.poppinsBold32
        label.textAlignment = .center
        label.text = Currency.rubble
        return label
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
        label.text = "0.0"
        return label
    }()
    
    lazy var expenseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [expenseIcon, expenseLabel, expenseCurrencyLabel])
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
        label.text = "0.0"
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
        label.textAlignment = .left
        return label
    }()
    
    lazy var tableHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var operationsTableView: OperationTableView = {
        let tableView = OperationTableView(frame: .zero, style: .plain)
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
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
        tableHeaderView.addSubview(infoView)
        tableHeaderView.addSubview(lastOperationsLabel)
        operationsTableView.tableHeaderView = tableHeaderView
        addSubview(operationsTableView)
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
        
        operationsTableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        tableHeaderView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        infoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(tableHeaderView.snp_top)
        }
        
        lastOperationsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(infoView.snp_bottom).offset(18)
            make.leading.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(9)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.center.equalTo(infoView)
            make.top.greaterThanOrEqualTo(infoView.snp.top).inset(28)
        }
        
        expenseCurrencyLabel.snp.makeConstraints { make in
            make.width.equalTo(22)
        }
        
        incomeCurrencyLabel.snp.makeConstraints { make in
            make.width.equalTo(expenseCurrencyLabel.snp_width)
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
            make.height.width.equalTo(incomeIcon)
        }
        
        expenseStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        differenceLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        
        differenceStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }

    }
}
