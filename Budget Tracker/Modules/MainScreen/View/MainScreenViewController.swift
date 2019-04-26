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
    
    lazy var contentView = MainScreenView()
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureToolbar()
    }
    
    private func addTargets() {
        contentView.statisticButton.addTarget(self, action: #selector(onClickStatistic), for: .touchUpInside)
        contentView.profileButton.addTarget(self, action: #selector(onClickProfile), for: .touchUpInside)
        contentView.dateTextField.addTarget(self, action: #selector(onClickDate), for: .touchUpInside)
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.profileButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: contentView.statisticButton)
        navigationItem.titleView = contentView.dateTextField
    }
    
    private func configureToolbar() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        contentView.dateToolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
    }
    
    
    // MARK: - Button's handlers
    
    @objc func onClickProfile(sender: UIButton){
        sender.pulsate()
        presenter.showProfileClicked()
    }
    
    @objc func onClickStatistic(sender: UIButton){
        sender.pulsate()
        presenter.showStatisticClicked()
    }
    
    // MARK: - Textfield's handler
    
    @objc func onClickDate(sender: UITextField){
        print("CLICK")
    }
    
    @objc func doneDatePicker() {
        view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        view.endEditing(true)
    }
}

extension MainScreenViewController: MainScreenViewInput {
    
}
