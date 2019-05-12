//
//  DetailScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 12/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class DetailScreenView: UIView {
    
    private let appearance = Appearance()
    
    // MARK: - Components
    
    lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        backButton.frame = UIConstants.navigationBarButtonFrame
        return backButton
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.getImage(.deleteIcon), for: .normal)
        button.frame = UIConstants.navigationBarButtonFrame
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = Fonts.poppinsBold20
        label.textColor = .black
        label.text = Titles.title
        return label
    }()
    
    lazy var dateIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.getImage(.calendarIcon)
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = Fonts.poppinsMedium20
        return label
    }()
    
    lazy var dateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateIcon, dateLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = appearance.stackViewSpacing
        return stackView
    }()
    
    lazy var categoryIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = Fonts.poppinsMedium20
        return label
    }()
    
    lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryIcon, categoryLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = appearance.stackViewSpacing
        return stackView
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = Fonts.poppinsMedium20
        label.text = Titles.total
        return label
    }()
    
    lazy var totalSumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .black
        label.font = Fonts.poppinsMedium20
        return label
    }()
    
    lazy var totalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalLabel, totalSumLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = appearance.stackViewSpacing
        return stackView
    }()
    
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = Fonts.poppinsMedium20
        label.text = Titles.comment
        return label
    }()
    
    lazy var commentTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = TextColors.gray
        label.font = Fonts.poppinsRegular16
        label.text = Titles.comment
        return label
    }()
    
    lazy var commentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [commentLabel, commentTextLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = appearance.stackViewSpacing
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            dateStackView,
            categoryStackView,
            totalStackView,
            commentStackView
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
            make.top.bottom.equalToSuperview().inset(appearance.mainStackViewInset)
            make.leading.equalToSuperview().inset(appearance.mainStackViewInset)
        }
        
        titleLabel.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        dateIcon.snp_makeConstraints { make in
            make.height.width.equalTo(appearance.iconSize)
        }
        
        dateStackView.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        categoryIcon.snp_makeConstraints { make in
            make.height.width.equalTo(appearance.iconSize)
        }
        
        categoryStackView.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        totalStackView.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        commentStackView.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
}

extension DetailScreenView {
    
    fileprivate struct Appearance {
        var mainStackViewSpacing: CGFloat { get { return 30 } }
        var mainStackViewInset: CGFloat { get { return 24 } }
        var stackViewSpacing: CGFloat { get { return 10 } }
        var iconSize: Int { get { return 24 } }
    }
}
