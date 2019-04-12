//
//  LogInScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class LogInScreenAssembly: LogInScreenFactoryProtocol {
    
    func getViewController() -> LogInScreenViewController {
        
        let viewController = LogInScreenViewController()
        configureModule(with: viewController)
        return viewController
    }
    
    private func configureModule(with view: LogInScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let presenter = LogInScreenPresenter()
        let router = LogInScreenRouter()
        let interactor = LogInScreenInteractor()
        let authService = AuthorizationService()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.authorizationService = authService
        
        router.presenter = presenter
        router.mainAssembly = MainScreenAssembly()
    }
}
