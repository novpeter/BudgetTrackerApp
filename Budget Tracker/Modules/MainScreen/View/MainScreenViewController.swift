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
    }
    
    private func addTargets() {
        contentView.statisticButton.addTarget(self, action: #selector(onClickStatistic), for: .touchUpInside)
        contentView.profileButton.addTarget(self, action: #selector(onClickProfile), for: .touchUpInside)
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contentView.profileButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: contentView.statisticButton)
    }
    
    
    // MARK: - Button's handlers
    
    @objc func onClickProfile(sender: UIButton){
        sender.pulsate()
    }
    
    @objc func onClickStatistic(sender: UIButton){
        sender.pulsate()
    }
}

extension MainScreenViewController: MainScreenViewInput {
    
}
