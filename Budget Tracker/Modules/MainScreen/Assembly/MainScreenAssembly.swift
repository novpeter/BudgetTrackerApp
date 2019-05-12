//
//  MainScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class MainScreenAssembly: MainScreenFactoryProtocol {
    
    func getViewController() -> MainScreenViewController {
        
        let viewController = MainScreenViewController()
        configureModule(with: viewController)
        return viewController
    }
    
    private func configureModule(with view: MainScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let presenter = MainScreenPresenter()
        let router = MainScreenRouter()
        let interactor = MainScreenInteractor()
        
        let profileAssembly = ProfileScreenAssembly()
        let addingAssembly = AddingScreenAssembly()
        let detailAssembly = DetailScreenAssembly()
        
        let authService = AuthService()
        let realmManager = RealmManager()
        let networkManager = NetworkManager()
        let operationsManager = OperationsManager()
        
        authService.realmManager = realmManager
        operationsManager.authService = authService
        operationsManager.realmManager = realmManager
        operationsManager.networkManager = networkManager
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.operationsManager = operationsManager
        
        router.view = view
        router.profileAssembly = profileAssembly
        router.addingAssembly = addingAssembly
        router.detailAssembly = detailAssembly
    }
}
