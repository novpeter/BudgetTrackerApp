//
//  DetailScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class DetailScreenPresenter:
    DetailScreenViewOutput,
    DetailScreenInteractorOutput,
    DetailScreenRouterOutput {
    
    weak var view: DetailScreenViewInput!
    var router: DetailScreenRouterInput!
    var interactor: DetailScreenInteractorInput!
    
    // MARK: - DetailScreenViewOutput
    
    // MARK: - DetailScreenInteractorOutput
    
    // MARK: - DetailScreenRouterOutput
}
