//
//  DetailScreenInteractor.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class DetailScreenInteractor: DetailScreenInteractorInput {
    
    var presenter: DetailScreenInteractorOutput!
    var operationsManager: OperationsManagerProtocol!
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss +zzzz"
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    func updateValues(with operationId: String) {
        presenter.startLoading()
        operationsManager.readOperation(operationClientId: operationId) { result in
            self.presenter.stopLoading()
            switch result {
            case .successReading(let operation):
                self.presenter.setValues(
                    type: operation.type,
                    title: operation.title,
                    date: self.dateFormatter.string(from: operation.date),
                    category: Categories(rawValue: operation.category) ?? .other,
                    sum: String(format: "%.0f", operation.sum),
                    comment: operation.comment
                )
                break
            case .readingError(let error):
                print("Reading error: \(error.localizedDescription)")
                break
            case .syncError(let error):
                print("Sync error: \(error.localizedDescription)")
                break
            default:
                break
            }
        }
    }
}
