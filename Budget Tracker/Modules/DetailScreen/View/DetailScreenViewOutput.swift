//
//  DetailScreenViewOutput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol DetailScreenViewOutput: AnyObject {
    
    /// Calls interactor to check current operation
    ///
    /// - Parameter operationId: current operation id
    func updateValues(with operationId: String)
}
