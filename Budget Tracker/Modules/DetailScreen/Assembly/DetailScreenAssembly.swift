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
    
    func getViewController(with operation: OperationModel) -> DetailScreenViewController {
        
        let viewController = DetailScreenViewController()
        configureModule(with: viewController)
        viewController.currentOperation = operation
        return viewController
    }
    
    private func configureModule(with view: DetailScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let presenter = DetailScreenPresenter()
        let router = DetailScreenRouter()
        let interactor = DetailScreenInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
    }
}
