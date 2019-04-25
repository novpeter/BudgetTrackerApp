//
//  LogOutScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

class ProfileScreenPresenter:
    ProfileScreenViewOutput,
    ProfileScreenInteractorOutput,
    ProfileScreenRouterOutput {
    
    weak var view: ProfileScreenViewInput!
    var router: ProfileScreenRouterInput!
    var interactor: ProfileScreenInteractorInput!
    
    func syncButtonClicked() {
        interactor.synchronize()
    }
    
    func logOutButtonClicked() {
        interactor.logOut()
    }
    
    // MARK: - ProfileScreenViewOutput
    
    // MARK: - ProfileScreenInteractorOutput
    
    func showWelcomeScreen() {
        router.showWelcomeScreen()
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
    
    // MARK: - ProfileScreenRouterOutput
}
