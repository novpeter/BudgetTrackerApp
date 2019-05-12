//
//  DetailScreenViewController.swift
//  Budget Tracker
//
//  Created by Петр on 28/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    var presenter: DetailScreenViewOutput!
    var currentOperation: OperationModel!
    private lazy var contentView = DetailScreenView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension DetailScreenViewController: DetailScreenViewInput {
    
}
