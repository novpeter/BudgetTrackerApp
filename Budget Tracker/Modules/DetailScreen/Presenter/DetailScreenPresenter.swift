//
//  DetailScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

class DetailScreenPresenter:
    DetailScreenViewOutput,
    DetailScreenInteractorOutput,
    DetailScreenRouterOutput {
    
    weak var view: DetailScreenViewInput!
    var router: DetailScreenRouterInput!
    var interactor: DetailScreenInteractorInput!
    
    func updateValues(with operationId: String) {
        interactor.updateValues(with: operationId)
    }
    
    // MARK: - DetailScreenViewOutput
    
    // MARK: - DetailScreenInteractorOutput
    
    func setValues(type: Int, title: String, date: String, category: Categories, sum: String, comment: String) {
        view.setValues(type: type, title: title, date: date, category: category, sum: sum, comment: comment)
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
    
    // MARK: - DetailScreenRouterOutput
}
