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
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    private func addTargets() {
        contentView.statisticButton.addTarget(self, action: #selector(onClickStatistic), for: .touchUpInside)
        contentView.profileButton.addTarget(self, action: #selector(onClickProfile), for: .touchUpInside)
        contentView.showAddingScreenButton.addTarget(self, action: #selector(onClickAddOperation), for: .touchUpInside)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = BackgroundColors.blue
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.profileButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: contentView.statisticButton)
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
    private func onClickStatistic(sender: UIButton) {
        sender.pulsate()
        presenter.showStatisticClicked()
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
    }
}

extension MainScreenViewController: MainScreenViewInput {
    
}
