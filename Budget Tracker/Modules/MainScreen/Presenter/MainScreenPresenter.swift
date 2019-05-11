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
    
    func addOperationClicked() {
        router.showAddScreen()
    }
    
    func updateValues(month: Int, year: Int) {
        interactor.updateValues(month: month, year: year)
    }
    
    // MARK: - MainScreenViewOutput
    
    // MARK: - MainScreenInteractorOutput
    
    func setValues(income: Double, expense: Double, operations: [OperationModel]) {
        view.setValues(income: income, expense: expense, operations: operations)
    }
    
    func startLoading() {
        router.startLoading()
    }
    
    func stopLoading() {
        router.stopLoading()
    }
    
    // MARK: - MainScreenRouterOutput
}
