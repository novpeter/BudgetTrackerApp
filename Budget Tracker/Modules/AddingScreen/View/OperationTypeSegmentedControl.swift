//
//  OperationTypeSegmentedControl.swift
//  Budget Tracker
//
//  Created by Петр on 02/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class OperationTypeSegmentedControl: UIView {
    
    private let appearance = Appearance()
    
    // MARK: - Selected index
    private var _selectedIndex: Int = 0
    var selectedIndex: Int { get { return _selectedIndex } }
    
    // MARK: - Components
    
    lazy var incomeTypeButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.backgroundColor = ButtonColors.Red
        button.titleLabel?.font = Fonts.PoppinsMedium16
        button.setTitleColor(.white, for: .normal)
        button.setTitle(ButtonTitles.Income, for: .normal)
        button.setImage(Images.getImage(.incomeTypeIconWhite), for: .normal)
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.clipsToBounds = true
        button.layer.cornerRadius = appearance.buttonCornerRadius
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return button
    }()
    
    lazy var expenseTypeButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.backgroundColor = .white
        button.titleLabel?.font = Fonts.PoppinsMedium16
        button.setTitleColor(.black, for: .normal)
        button.setTitle(ButtonTitles.Expense, for: .normal)
        button.setImage(Images.getImage(.expenseTypeIconBlack), for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = UIConstants.buttonBorderWidth
        button.layer.cornerRadius = appearance.buttonCornerRadius
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return button
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeTypeButton, expenseTypeButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
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
        addSubview(buttonsStackView)
    }
    
    private func addConstraints() {
        buttonsStackView.snp_makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    // MARK: - Segmented control method
    
    func selectType(index: Int) {
        guard index == 0 || index == 1 || _selectedIndex == index else { return }
        _selectedIndex = index
        switch index {
        case 0:
            makeButtonSelected(button: incomeTypeButton)
            makeButtonDeselected(button: expenseTypeButton)
        case 1:
            makeButtonSelected(button: expenseTypeButton)
            makeButtonDeselected(button: incomeTypeButton)
        default:
            break
        }
    }
    
    private func makeButtonSelected(button: UIButton) {
        button.backgroundColor = ButtonColors.Red
        button.setTitleColor(.white, for: .normal)
        switch button.tag {
        case 0: button.setImage(Images.getImage(.incomeTypeIconWhite), for: .normal)
        case 1: button.setImage(Images.getImage(.expenseTypeIconWhite), for: .normal)
        default: break
        }
    }
    
    private func makeButtonDeselected(button: UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        switch button.tag {
        case 0: button.setImage(Images.getImage(.incomeTypeIconBlack), for: .normal)
        case 1: button.setImage(Images.getImage(.expenseTypeIconBlack), for: .normal)
        default: break
        }
    }
}

extension OperationTypeSegmentedControl {
    
    fileprivate struct Appearance {
        let buttonCornerRadius: CGFloat = 10
    }
}
