//
//  SignUpScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class SignUpScreenAssembly: SignUpScreenFactoryProtocol {
    
    func getViewController() -> SignUpScreenViewController {
        
        let viewController = SignUpScreenViewController()
        configureModule(with: viewController)
        return viewController
    }
    
    private func configureModule(with view: SignUpScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let presenter = SignUpScreenPresenter()
        let router = SignUpScreenRouter()
        let interactor = SignUpScreenInteractor()
        let networkManager = NetworkManager()
        let realmManager = RealmManager()
        let authService = AuthService()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.authService = authService
        authService.networkManager = networkManager
        authService.realmManager = realmManager
        
        router.presenter = presenter
        router.mainAssembly = MainScreenAssembly()
    }
}
