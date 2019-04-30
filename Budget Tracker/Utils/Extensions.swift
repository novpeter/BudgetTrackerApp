//
//  Extenssions.swift
//  Budget Tracker
//
//  Created by Петр on 10/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

extension UIButton {
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.1
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = false
        pulse.repeatCount = 1
        pulse.initialVelocity = -0.2
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
    }
}

extension String {
    
    func regex(mask: String) -> Bool {
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", mask)
        return passwordTest.evaluate(with: self)
    }
}

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
}
