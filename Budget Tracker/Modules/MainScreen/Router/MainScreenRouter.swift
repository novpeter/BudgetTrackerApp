//
//  MainScreenRouter.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SVProgressHUD

class MainScreenRouter: MainScreenRouterInput {
    
    weak var view: UIViewController!
    var presenter: MainScreenRouterOutput!
    var profileAssembly: ProfileScreenFactoryProtocol!
    var addingAssembly: AddingScreenFactoryProtocol!
    var detailAssembly: DetailScreenFactoryProtocol!
    
    func showProfileScreen() {
        let profileViewController = profileAssembly.getViewController()
        view?.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func showAddScreen() {
        let addingScreenViewController = addingAssembly.getViewController()
        view?.navigationController?.pushViewController(addingScreenViewController, animated: true)
    }
    
    func showDetailScreen(with operation: OperationModel) {
        let addingScreenViewController = detailAssembly.getViewController(with: operation.clientId)
        view?.navigationController?.pushViewController(addingScreenViewController, animated: true)
    }
    
    func startLoading() {
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
}
