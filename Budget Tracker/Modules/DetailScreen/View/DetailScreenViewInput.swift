//
//  DetailScreenViewInput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol DetailScreenViewInput: AnyObject {
    
    /// Sets values of current operation
    ///
    /// - Parameters:
    ///   - type: operation type
    ///   - title: operation title
    ///   - date: operation date
    ///   - category: operation category
    ///   - sum: operation sum
    ///   - comment: operation comment
    func setValues(type: Int, title: String, date: String, category: Categories, sum: String, comment: String)
}
