//
//  AddingScreenViewInput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol AddingScreenViewInput: AnyObject {
    
    /// Sets values in fields
    ///
    /// - Parameters:
    ///   - selectedIndex: operation type
    ///   - category: selected category
    ///   - date: date as string
    func setValues(selectedIndex: Int, category: Categories, date: String)
}
