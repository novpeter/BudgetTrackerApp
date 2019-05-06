//
//  AddingScreenInteractor.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class AddingScreenInteractor: AddingScreenInteractorInput {
    
    var presenter: AddingScreenInteractorOutput!
    
    func setInitialState() {
        let operationTypeSelectedIndex = 0
        let currentCategory = Categories.other
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        presenter.setValues(selectedIndex: operationTypeSelectedIndex, category: currentCategory, date: currentDate)
    }
    
    func addNewOperation(title: String?, comment: String?, category: String?, date: String?, sum: String?) {
        // TODO: - connect manager 
    }
}
