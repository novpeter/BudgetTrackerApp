//
//  DetailScreenRouter.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SVProgressHUD
import SCLAlertView

class DetailScreenRouter: DetailScreenRouterInput {
    
    weak var view: UIViewController!
    var presenter: DetailScreenRouterOutput!
    var alertManager: AlertManagerProtocol!
    
    func showAlert(title: AlertTitles, subTitle: AlertSubTitles, type: SCLAlertViewStyle) {
        alertManager.show(title: title, subTitle: subTitle, type: type)
    }
    
    func showDeleteActionSheet(completionCallback: @escaping (ActionSheetResult) -> ()) {
        let alertController = UIAlertController(title: nil, message: "Do you want to delete?", preferredStyle: .actionSheet)
        
        alertController.addAction(
            UIAlertAction(title: "Delete", style: .destructive, handler: { (alert: UIAlertAction!) -> Void in
                completionCallback(.delete)
            })
        )
        alertController.addAction(
            UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert: UIAlertAction!) -> Void in
                completionCallback(.cancel)
            })
        )
        
        view?.present(alertController, animated: true, completion: nil)
    }
    
    func showMainScreen() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func startLoading() {
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
}
