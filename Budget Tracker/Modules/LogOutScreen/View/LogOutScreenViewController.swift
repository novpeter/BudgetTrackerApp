//
//  LogOutScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class LogOutScreenViewController: UIViewController {
    
    var presenter: LogOutScreenViewOutput!
    
    lazy var contentView = LogOutScreenView()
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
    }
    
    private func addTargets() {
        contentView.syncButton.addTarget(self, action: #selector(syncButtonClicked), for: .touchUpInside)
        contentView.logOutButton.addTarget(self, action: #selector(logOutButtonClicked), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
    
}

extension LogOutScreenViewController: LogOutScreenViewInput {
    
}
