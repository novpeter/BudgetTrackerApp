//
//  AddingScreenViewOutput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol AddingScreenViewOutput: AnyObject {
    
    /// Calls interactor to set initial values
    func setInitialState()
    
    /// Sends new operation values to interactor
    ///
    /// - Parameters:
    ///   - title: title
    ///   - comment: comment
    ///   - category: operation category
    ///   - date: operation date
    ///   - sum: operation sum
    func addNewOperation(title: String?, comment: String?, category: String?, date: String?, sum: String?)
}
