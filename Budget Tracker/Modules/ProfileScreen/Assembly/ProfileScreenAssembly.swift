//
//  ProfileScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class ProfileScreenAssembly: ProfileScreenFactoryProtocol {
    
    func getViewController() -> ProfileScreenViewController {
        
        let viewController = ProfileScreenViewController()
        configureModule(with: viewController)
        return viewController
    }
    
    private func configureModule(with view: ProfileScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let welcomeAssembly = WelcomeScreenAssembly()
        let presenter = ProfileScreenPresenter()
        let router = ProfileScreenRouter()
        let interactor = ProfileScreenInteractor()
        
        let realmManager = RealmManager()
        let networkManager = NetworkManager()
        let authService = AuthService()
        let alertManager = AlertManager()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.authService = authService
        authService.realmManager = realmManager
        authService.networkManager = networkManager
        
        router.welcomeAssembly = welcomeAssembly
        router.alertManager = alertManager
    }
}
