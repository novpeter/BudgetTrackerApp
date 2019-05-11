//
//  OperationCell.swift
//  Budget Tracker
//
//  Created by Петр on 09/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class OperationCell: UITableViewCell {
    
    fileprivate lazy var content = OperationCellView()
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(content)
        configureContentView()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureContentView() {
        content.layer.cornerRadius = UIConstants.buttonCornerRadius
        content.layer.borderWidth = UIConstants.buttonBorderWidth
        content.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        content.layer.shadowOffset = CGSize(width: 3, height: 10)
        content.layer.shadowOpacity = UIConstants.buttonShadowOpacity
        content.layer.shadowRadius = UIConstants.buttonShadowRadius
    }
    
    private func configureConstraints() {
        content.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(18)
        }
    }
    
    func configure(with operation: OperationModel) {
        content.titleLabel.text = operation.title
        content.dateLabel.text = String(describing: dateFormatter.date(from: String(describing: operation.date)))
        content.sumLabel.text = String(describing: operation.sum)
        
        switch operation.type {
        case 0:
            content.categoryIcon.image = Images.getImage(.incomeImage)
        case 1:
            guard let category = Categories(rawValue: operation.category) else { break }
            content.categoryIcon.image = Categories.getCategoryIcon(category)
        default:
            break
        }
    }
}

fileprivate class OperationCellView: UIView {
    
    let appearance = Appearance()
    
    lazy var categoryIcon: UIImageView = {
        return UIImageView()
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = Fonts.poppinsMedium16
        label.textAlignment = .left
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = Fonts.poppinsLight12
        label.textAlignment = .left
        return label
    }()
    
    lazy var sumLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = Fonts.poppinsMedium16
        label.textAlignment = .right
        return label
    }()
    
    lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, dateLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = appearance.textStackViewSpacing
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryIcon, textStackView, sumLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = appearance.mainStackViewSpacing
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
    
    
    // MARK: - Configurating
    
    private func addSubviews() {
        addSubview(mainStackView)
    }
    
    private func addConstraints() {
        
        mainStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.top.equalTo(appearance.mainStackViewInset)
        }
        
        categoryIcon.snp_makeConstraints { make in
            make.height.width.equalTo(appearance.iconSize)
        }
        
        sumLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(appearance.sumMaxWidth)
        }
    }
}

extension OperationCellView {
    
    fileprivate struct Appearance {
        let iconSize: CGFloat = 24
        
        let sumMaxWidth: CGFloat = 54
        
        let textStackViewSpacing: CGFloat = 10
        
        let mainStackViewSpacing: CGFloat = 20
        let mainStackViewInset: CGFloat = 20
    }
}
