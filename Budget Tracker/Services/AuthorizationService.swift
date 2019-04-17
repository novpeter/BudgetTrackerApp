//
//  AuthorizationService.swift
//  Budget Tracker
//
//  Created by Петр on 12/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class AuthorizationService {
    
    func checkEmail(email: String) -> Bool {
        let range = NSRange(location: 0, length: email.utf16.count)
        let regex = try! NSRegularExpression(pattern: Regex.Email)
        return regex.firstMatch(in: email, options: [], range: range) != nil
    }
    
    func checkPassword(password: String) -> Bool {
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", Regex.Password)
        return passwordTest.evaluate(with: password)
    }
}
