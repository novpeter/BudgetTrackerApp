//
//  DetailScreenInteractorInput.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol DetailScreenInteractorInput: AnyObject {
    
    /// Sends request to the server to get operation
    ///
    /// - Parameter operationId: current operation
    func updateValues(with operationId: String)
}
