//
//  AddingScreenInteractor.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SCLAlertView

class AddingScreenInteractor: AddingScreenInteractorInput {
    
    var presenter: AddingScreenInteractorOutput!
    var authService: AuthServiceProtocol!
    var operationsManager: OperationsManagerProtocol!
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    
    func setInitialState() {
        let operationTypeSelectedIndex = 0
        let currentCategory = Categories.other
        
        let currentDate = dateFormatter.string(from: Date())
        presenter.setValues(selectedIndex: operationTypeSelectedIndex, category: currentCategory, date: currentDate)
    }
    
    func addNewOperation(type: Int, title: String?, comment: String?, category: String?, date: String?, sum: String?) {
        guard let title = title,
            let category = category,
            let dateString = date,
            let date = dateFormatter.date(from: dateString),
            let sumString = sum,
            let sum = Double(sumString) else {
            presenter.showAlert(title: .genericError, subTitle: .checkAllFields, alertType: .error)
            return
        }
        
        presenter.startLoading()
        
        // 1. Create operation
        let operation = OperationModel()
        operation.title = title
        operation.comment = comment == Placeholders.comment ? String() : comment ?? String()
        operation.date = date
        operation.type = type
        operation.sum = sum
        operation.category = category
        
        // 2. Save operation
        self.operationsManager.createOperation(operation: operation, completion: { result in
            self.presenter.stopLoading()
            switch result {
            case .success:
                self.presenter.closeAddingScreen()
            case .savingError(let savingError):
                fatalError(savingError.localizedDescription)
            case .syncError(let syncError):
                print("Sync error: \(syncError.localizedDescription)")
                self.presenter.closeAddingScreen()
                break
            default:
                break
            }
        })
    }
}
