//
//  SignInScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class SignInScreenAssembly: SignInScreenFactoryProtocol {
    
    func getViewController() -> SignInScreenViewController {
        
        let viewController = SignInScreenViewController()
        configureModule(with: viewController)
        return viewController
    }
    
    private func configureModule(with view: SignInScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let presenter = SignInScreenPresenter()
        let router = SignInScreenRouter()
        let interactor = SignInScreenInteractor()
        let networkManager = NetworkManager()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.networkManager = networkManager
        
        router.presenter = presenter
        router.mainAssembly = MainScreenAssembly()
    }
}
