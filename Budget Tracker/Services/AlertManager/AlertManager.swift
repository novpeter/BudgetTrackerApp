//
//  AlertManager.swift
//  Budget Tracker
//
//  Created by Петр on 24/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

class AlertManager: AlertManagerProtocol {
    
    func show(title: AlertTitles, subTitle: AlertSubTitles, type: SCLAlertViewStyle) {
        switch type {
        case .success:
            SCLAlertView().showSuccess(title.rawValue, subTitle: subTitle.rawValue)
        case .error:
            SCLAlertView().showError(title.rawValue, subTitle: subTitle.rawValue)
        case .info:
            SCLAlertView().showInfo(title.rawValue, subTitle: subTitle.rawValue)
        default:
            break
        }
    }
}
