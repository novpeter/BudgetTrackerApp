//
//  AddingScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class AddingScreenPresenter:
    AddingScreenViewOutput,
    AddingScreenInteractorOutput,
    AddingScreenRouterOutput {
    
    weak var view: AddingScreenViewInput!
    var router: AddingScreenRouterInput!
    var interactor: AddingScreenInteractorInput!
    
    // MARK: - AddingScreenViewOutput
    
    // MARK: - AddingScreenInteractorOutput
    
    // MARK: - AddingScreenRouterOutput
}
