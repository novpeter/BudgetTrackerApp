//
//  AddingScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class AddingScreenAssembly: AddingScreenFactoryProtocol {
    
    func getViewController() -> AddingScreenViewController {
        
        let viewController = AddingScreenViewController()
        configureModule(with: viewController)
        return viewController
    }
    
    private func configureModule(with view: AddingScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let presenter = AddingScreenPresenter()
        let router = AddingScreenRouter()
        let interactor = AddingScreenInteractor()
        
        let alertManager = AlertManager()
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
        interactor.realmManager = realmManager
        interactor.operationsManager = operationsManager
        
        router.presenter = presenter
        router.alertManager = alertManager
        router.view = view
    }
}
