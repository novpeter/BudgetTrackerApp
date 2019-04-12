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
    
    override func loadView() {
        super.loadView()
        
        let view = WelcomeScreenView(frame: UIScreen.main.bounds)
        
        view.logInButton.addTarget(self, action: #selector(logInButtonClicked), for: .touchUpInside)
        view.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        
        self.view = view
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
    
    @objc func logInButtonClicked(sender: UIButton) {
        sender.pulsate()
        presenter.logInButtonClicked()
    }
    
    @objc func signUpButtonClicked(sender: UIButton) {
        sender.pulsate()
        presenter.signUpButtonClicked()
    }
}

extension WelcomeScreenViewController: WelcomeScreenViewInput {
    
}
