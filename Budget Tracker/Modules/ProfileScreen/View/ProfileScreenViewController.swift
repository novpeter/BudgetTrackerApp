//
//  ProfileScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class ProfileScreenViewController: UIViewController {
    
    var presenter: ProfileScreenViewOutput!
    
    lazy var contentView = ProfileScreenView()
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private func addTargets() {
        contentView.syncButton.addTarget(self, action: #selector(syncButtonClicked), for: .touchUpInside)
        contentView.logOutButton.addTarget(self, action: #selector(logOutButtonClicked), for: .touchUpInside)
        contentView.backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.backButton)
    }
    
    // MARK: - Button's handlers
    
    @objc func syncButtonClicked(sender: UIButton) {
        sender.pulsate()
        presenter.syncButtonClicked()
    }
    
    @objc func logOutButtonClicked(sender: UIButton) {
        sender.pulsate()
        presenter.logOutButtonClicked()
    }
    
    @objc func onClickBack(){
        navigationController?.popViewController(animated: true)
    }
    
}

extension ProfileScreenViewController: ProfileScreenViewInput {
    
}
