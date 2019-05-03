//
//  AddingScreenInteractorOutput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

protocol AddingScreenInteractorOutput: AnyObject {
    
    /// Calls presenter to set values in fields
    ///
    /// - Parameters:
    ///   - selectedIndex: operation type
    ///   - category: selected category
    ///   - date: date as string
    func setValues(selectedIndex: Int, category: Categories, date: String)
    
    /// Calls router to close adding screen
    func closeAddingScreen()
}
