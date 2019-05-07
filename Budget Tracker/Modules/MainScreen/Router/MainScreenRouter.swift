//
//  MainScreenRouter.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class MainScreenRouter: MainScreenRouterInput {
    
    weak var view: UIViewController!
    var presenter: MainScreenRouterOutput!
    var profileAssembly: ProfileScreenFactoryProtocol!
    var addingAssembly: AddingScreenFactoryProtocol!
    
    func showProfileScreen() {
        let profileViewController = profileAssembly.getViewController()
        view?.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func showStatisticScreen() {
        // TODO: - implement statistic screen segue
    }
    
    func showAddScreen() {
        let addingScreenViewController = addingAssembly.getViewController()
        view?.navigationController?.pushViewController(addingScreenViewController, animated: true)
    }
}
