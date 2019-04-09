//
//  BaseTextField.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class BaseTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .black
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
