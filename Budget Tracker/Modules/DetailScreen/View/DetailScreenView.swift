//
//  DetailScreenView.swift
//  Budget Tracker
//
//  Created by Петр on 12/05/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class DetailScreenView: UIView {
    
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
        
    }
    
    private func addConstraints() {
    
    }
}

extension AddingScreenView {
    
    fileprivate struct Appearance {
       
    }
}
