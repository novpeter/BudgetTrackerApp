//
//  LogOutScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

class LogOutScreenPresenter:
    LogOutScreenViewOutput,
    LogOutScreenInteractorOutput,
    LogOutScreenRouterOutput {
    
    weak var view: LogOutScreenViewInput!
    var router: LogOutScreenRouterInput!
    var interactor: LogOutScreenInteractorInput!
    
    func syncButtonClicked() {
        interactor.synchronize()
    }
    
    func logOutButtonClicked() {
        interactor.logOut()
    }
    
    // MARK: - LogOutScreenViewOutput
    
    // MARK: - LogOutScreenInteractorOutput
    
    func showWelcomeScreen() {
        router.showWelcomeScreen()
    }
    
    func showAlert(title: String, description: String, type: SCLAlertViewStyle) {
        router.showAlert(title: title, description: description, type: type)
    }
    
    // MARK: - LogOutScreenRouterOutput
}
