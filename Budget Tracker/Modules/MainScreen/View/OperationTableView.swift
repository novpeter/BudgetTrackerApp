//
//  OperationTableView.swift
//  Budget Tracker
//
//  Created by Петр on 12/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class OperationTableView: UITableView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let header = tableHeaderView else { return }
        
        if let infoView = header.subviews.first {
//            let offsetY = -contentOffset.y > 0 ? -contentOffset.y : contentOffset.y
//            print("\(infoView.bounds.height) - \(offsetY)")
//            infoView.frame = CGRect(
//                x: 0 ,
//                y: 0,
//                width: infoView.frame.width,
//                height: max(infoView.bounds.height, infoView.bounds.height + offsetY)
//            )
        }
    }
}
