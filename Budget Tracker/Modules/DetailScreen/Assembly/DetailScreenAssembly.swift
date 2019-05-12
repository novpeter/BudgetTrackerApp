//
//  DetailScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class DetailScreenAssembly: DetailScreenFactoryProtocol {
    
    func getViewController(with operationId: String) -> DetailScreenViewController {
        
        let viewController = DetailScreenViewController()
        configureModule(with: viewController)
        viewController.currentOperationId = operationId
        return viewController
    }
    
    private func configureModule(with view: DetailScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let presenter = DetailScreenPresenter()
        let router = DetailScreenRouter()
        let interactor = DetailScreenInteractor()
        
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
        interactor.operationsManager = operationsManager
        
        router.alertManager = alertManager
    }
}
