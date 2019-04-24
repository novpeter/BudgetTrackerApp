//
//  LogOutScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class LogOutScreenAssembly: LogOutScreenFactoryProtocol {
    
    func getViewController() -> LogOutScreenViewController {
        
        let viewController = LogOutScreenViewController()
        configureModule(with: viewController)
        return viewController
    }
    
    private func configureModule(with view: LogOutScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let welcomeAssembly = WelcomeScreenAssembly()
        let presenter = LogOutScreenPresenter()
        let router = LogOutScreenRouter()
        let interactor = LogOutScreenInteractor()
        let realmManager = RealmManager()
        let networkManager = NetworkManager()
        let authService = AuthService()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.authService = authService
        authService.realmManager = realmManager
        authService.networkManager = networkManager
        
        router.welcomeAssembly = welcomeAssembly
    }
}
