//
//  LogInScreenFactoryProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol LogInScreenFactoryProtocol: AnyObject {
    
    func getViewController() -> LogInScreenViewController
}
