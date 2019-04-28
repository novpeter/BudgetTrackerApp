//
//  StatisticsScreenAssembly.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class StatisticsScreenAssembly: StatisticsScreenFactoryProtocol {
    
    func getViewController() -> StatisticsScreenViewController {
        
        let viewController = StatisticsScreenViewController()
        configureModule(with: viewController)
        return viewController
    }
    
    private func configureModule(with view: StatisticsScreenViewController?) {
        
        guard let view = view else { fatalError() }
        
        let presenter = StatisticsScreenPresenter()
        let router = StatisticsScreenRouter()
        let interactor = StatisticsScreenInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
    }
}
