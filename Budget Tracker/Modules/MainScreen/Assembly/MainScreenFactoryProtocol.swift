//
//  MainScreenFactoryProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol MainScreenFactoryProtocol: AnyObject {
    
    func getViewController() -> MainScreenViewController
}
