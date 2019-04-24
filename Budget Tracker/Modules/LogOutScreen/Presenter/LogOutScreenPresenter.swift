//
//  LogOutScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class LogOutScreenPresenter:
    LogOutScreenViewOutput,
    LogOutScreenInteractorOutput,
    LogOutScreenRouterOutput {
    
    weak var view: LogOutScreenViewInput!
    var router: LogOutScreenRouterInput!
    var interactor: LogOutScreenInteractorInput!
    
    func syncButtonClicked() {
        
    }
    
    func logOutButtonClicked() {
        
    }
    
    // MARK: - LogOutScreenViewOutput
    
    // MARK: - LogOutScreenInteractorOutput
    
    // MARK: - LogOutScreenRouterOutput
}
