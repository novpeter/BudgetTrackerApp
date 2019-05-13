//
//  DetailScreenFactoryProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol DetailScreenFactoryProtocol: AnyObject {
    
    func getViewController(with operationId: String) -> DetailScreenViewController
}
