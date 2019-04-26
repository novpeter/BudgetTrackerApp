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
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        router.profileAssembly = profileAssembly
    }
}
