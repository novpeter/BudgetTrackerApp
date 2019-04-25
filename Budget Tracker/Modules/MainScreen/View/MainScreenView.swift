//
//  MainScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 25/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class MainScreenView: UIView {
    
    // MARK: - Components
    
    lazy var profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profileButton"), for: .normal)
        profileButton.frame = UIConstants.navigationBarBattonFrame
        return profileButton
    }()
    
    lazy var statisticButton: UIButton = {
        let statisticButton = UIButton()
        statisticButton.setImage(UIImage(named: "statisticButton"), for: .normal)
        statisticButton.frame = UIConstants.navigationBarBattonFrame
        return statisticButton
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubviews()
        addConstraints()
    }
    
    
    // MARK: - Congigurating
    
    private func addSubviews() {
        self.backgroundColor = .white
    }
    
    private func addConstraints() {
        
    }
}
