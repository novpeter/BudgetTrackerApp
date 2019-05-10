//
//  AddingScreenInteractorInput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol AddingScreenInteractorInput: AnyObject {
    
    /// Sets initial values
    func setInitialState()
    
    /// validates and creates new operation values
    ///
    /// - Parameters:
    ///   - type: operation type
    ///   - title: title
    ///   - comment: comment
    ///   - category: operation category
    ///   - date: operation date
    ///   - sum: operation sum
    func addNewOperation(type: Int, title: String?, comment: String?, category: String?, date: String?, sum: String?)
}
