//
//  WelcomeScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class WelcomeScreenAssembly: WelcomeScreenFactoryProtocol {
    
    func getViewController() -> WelcomeScreenViewController {
        
        let viewController = WelcomeScreenViewController()
        configureModule(with: viewController)
        return viewController
    }
    
    private func configureModule(with view: WelcomeScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let presenter = WelcomeScreenPresenter()
        let router = WelcomeScreenRouter()
        let interactor = WelcomeScreenInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        router.logInAssembly = LogInScreenAssembly()
        router.signUpAssembly = SignUpScreenAssembly()
    }
}
