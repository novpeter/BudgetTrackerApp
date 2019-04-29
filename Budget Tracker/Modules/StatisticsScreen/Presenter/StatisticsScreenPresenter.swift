//
//  StatisticsScreenPresenter.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class StatisticsScreenPresenter:
    StatisticsScreenViewOutput,
    StatisticsScreenInteractorOutput,
    StatisticsScreenRouterOutput {
    
    weak var view: StatisticsScreenViewInput!
    var router: StatisticsScreenRouterInput!
    var interactor: StatisticsScreenInteractorInput!
    
    // MARK: - StatisticsScreenViewOutput
    
    // MARK: - StatisticsScreenInteractorOutput
    
    // MARK: - StatisticsScreenRouterOutput
}
