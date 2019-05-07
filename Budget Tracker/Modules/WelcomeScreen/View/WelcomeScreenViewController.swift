//
//  WelcomeScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    var presenter: WelcomeScreenViewOutput!
    
    lazy var contentView = WelcomeScreenView(frame: UIScreen.main.bounds)
    
    override func loadView() {
        super.loadView()
        
        view = contentView
        addTargets()
    }
    
    private func addTargets() {
        contentView.signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
        contentView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Button's handlers
    
    @objc
    func signInButtonClicked(sender: UIButton) {
        sender.pulsate()
        presenter.signInButtonClicked()
    }
    
    @objc
    func signUpButtonClicked(sender: UIButton) {
        sender.pulsate()
        presenter.signUpButtonClicked()
    }
}

extension WelcomeScreenViewController: WelcomeScreenViewInput {
    
}
