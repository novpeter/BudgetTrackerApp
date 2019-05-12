//
//  MainScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    var presenter: MainScreenViewOutput!
    
    private lazy var contentView = MainScreenView()
    
    var currentOperations: [OperationModel]!
    
    override func loadView() {
        super.loadView()
        view = contentView
        addTargets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.operationsTableView.register(OperationCell.self, forCellReuseIdentifier: UIConstants.cellIdentifier)
        contentView.operationsTableView.delegate = self
        contentView.operationsTableView.dataSource = self
        
        configureToolbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        presenter.updateValues(month: contentView.datePicker.month, year: contentView.datePicker.year)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    private func addTargets() {
        contentView.profileButton.addTarget(self, action: #selector(onClickProfile), for: .touchUpInside)
        contentView.showAddingScreenButton.addTarget(self, action: #selector(onClickAddOperation), for: .touchUpInside)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = BackgroundColors.blue
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.profileButton)
        navigationItem.titleView = contentView.dateTextField
    }
    
    private func configureToolbar() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(endEditingDateTextField));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        contentView.dateToolBar.setItems([spaceButton, doneButton], animated: false)
    }
    
    
    // MARK: - Button's handlers
    
    @objc
    private func onClickProfile(sender: UIButton) {
        sender.pulsate()
        presenter.showProfileClicked()
    }
    
    @objc
    private func onClickAddOperation(sender: UIButton) {
        sender.pulsate()
        presenter.addOperationClicked()
    }
    
    
    // MARK: - Date picker handler
    
    @objc
    private func endEditingDateTextField() {
        contentView.dateTextField.endEditing(true)
        presenter.updateValues(month: contentView.datePicker.month, year: contentView.datePicker.year)
    }
}

extension MainScreenViewController: MainScreenViewInput {
    
    func setValues(income: Int, expense: Int, operations: [OperationModel]) {
        currentOperations = operations
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let difference = income - expense
            self.contentView.incomeLabel.text = String(income)
            self.contentView.expenseLabel.text = String(expense)
            self.contentView.differenceTotalLabel.text = "\(String(difference)) \(Currency.rubble)"
            difference < 0
                ? (self.contentView.differenceTotalLabel.textColor = .red)
                : (self.contentView.differenceTotalLabel.textColor = TextColors.green)
            self.contentView.operationsTableView.reloadData()
        }
    }
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentOperations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentView.operationsTableView.dequeueReusableCell(withIdentifier: UIConstants.cellIdentifier) as! OperationCell
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGFloat.greatestFiniteMagnitude)
        cell.directionalLayoutMargins = .zero
        cell.configure(with: currentOperations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
