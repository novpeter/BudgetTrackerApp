//
//  DetailScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    var presenter: DetailScreenViewOutput!
    var currentOperationId: String!
    private lazy var contentView = DetailScreenView()
    
    override func loadView() {
        super.loadView()
        view = contentView
        addTargets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        presenter.updateValues(with: currentOperationId)
    }
    
    private func addTargets() {
        contentView.backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        contentView.deleteButton.addTarget(self, action: #selector(onClickDelete), for: .valueChanged)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: contentView.deleteButton)
    }
    
    
    
    // MARK: - Button handlers
    
    @objc
    func onClickBack(_ sender: UIButton) {
        sender.pulsate()
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func onClickDelete(_ sender: UIButton) {
        sender.pulsate()
        
    }
    
}

extension DetailScreenViewController: DetailScreenViewInput {
    
    func setValues(type: Int, title: String, date: String, category: Categories, sum: String, comment: String = "") {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.contentView.titleLabel.text = title
            self.contentView.dateLabel.text = date
            self.contentView.totalSumLabel.text = "\(sum) \(Currency.rubble)"
            self.contentView.commentTextLabel.text = comment
            switch type {
            case 0:
                self.contentView.categoryLabel.text = Titles.income
                self.contentView.categoryIcon.image = Images.getImage(.incomeImage)
            case 1:
                self.contentView.categoryLabel.text = category.rawValue
                self.contentView.categoryIcon.image = Categories.getCategoryIcon(category)
            default:
                break
            }
            
        }
    }
}
