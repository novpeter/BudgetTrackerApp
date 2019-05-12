//
//  MainScreenInteractor.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class MainScreenInteractor: MainScreenInteractorInput {
    
    var presenter: MainScreenInteractorOutput!
    var operationsManager: OperationsManagerProtocol!
    
    func updateValues(month: Int, year: Int) {
        presenter.startLoading()
        
        let operations = operationsManager.getOperations(month: month, year: year)
        var incomeTotal: Double = 0
        var expenseTotal: Double = 0
        for operation in operations {
            switch operation.type {
            case 0:
                incomeTotal += operation.sum
            case 1:
                expenseTotal += operation.sum
            default:
                print("Incorrect type")
                break
            }
        }
        
        presenter.stopLoading()
        presenter.setValues(income: Int(incomeTotal), expense: Int(expenseTotal), operations: operations)
    }
}
