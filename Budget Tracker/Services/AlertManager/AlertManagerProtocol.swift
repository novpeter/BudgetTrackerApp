//
//  AlertManagerProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 24/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import SCLAlertView

protocol AlertManagerProtocol {
    
    /// Shows alert with given parameters
    ///
    /// - Parameters:
    ///   - title: title
    ///   - subTitle: subtitle
    ///   - type: type of alert
    func show(title: AlertTitles, subTitle: AlertSubTitles, type: SCLAlertViewStyle)
}
