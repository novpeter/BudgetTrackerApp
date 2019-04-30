//
//  MainScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class MainScreenPresenter:
    MainScreenViewOutput,
    MainScreenInteractorOutput,
    MainScreenRouterOutput {
    
    weak var view: MainScreenViewInput!
    var router: MainScreenRouterInput!
    var interactor: MainScreenInteractorInput!
    
    func showProfileClicked() {
        router.showProfileScreen()
    }
    
    func showStatisticClicked() {
        router.showStatisticScreen()
    }
    
    func addOperationClicked() {
        router.showAddScreen()
    }
    
    // MARK: - MainScreenViewOutput
    
    // MARK: - MainScreenInteractorOutput
    
    // MARK: - MainScreenRouterOutput
}
