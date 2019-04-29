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
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
    }
}
