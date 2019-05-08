//
//  AddingScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

class AddingScreenPresenter:
    AddingScreenViewOutput,
    AddingScreenInteractorOutput,
    AddingScreenRouterOutput {
    
    weak var view: AddingScreenViewInput!
    var router: AddingScreenRouterInput!
    var interactor: AddingScreenInteractorInput!
    
    func setInitialState() {
        interactor.setInitialState()
    }
    
    func addNewOperation(type: Int, title: String?, comment: String?, category: String?, date: String?, sum: String?) {
        interactor.addNewOperation(type: type, title: title, comment: comment, category: category, date: date, sum: sum)
    }
    
    // MARK: - AddingScreenViewOutput
    
    // MARK: - AddingScreenInteractorOutput
    
    func setValues(selectedIndex: Int, category: Categories, date: String) {
        view.setValues(selectedIndex: selectedIndex, category: category, date: date)
    }
    
    func closeAddingScreen() {
        router.closeAddingScreen()
    }
    
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, alertType: SCLAlertViewStyle) {
        router.showAlert(title: title, subTitle: subTitle, type: alertType)
    }
    
    func startLoading() {
        router.startLoading()
    }
    
    func stopLoading() {
        router.stopLoading()
    }
    
    // MARK: - AddingScreenRouterOutput
}
