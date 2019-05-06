//
//  NumericConstants.swift
//  Budget Tracker
//
//  Created by Петр on 25/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

struct UIConstants {
    static let buttonCornerRadius: CGFloat = 15.0
    static let buttonShadowRadius: CGFloat = 10.0
    static let buttonBorderWidth: CGFloat = 0.15
    static let buttonShadowOpacity: Float = 1.0
    static let buttonShadowColor: CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
    static let buttonShadowOffset: CGSize = CGSize(width: 3, height: 10)
    static let buttonHeight: CGFloat = 50
    
    static let navigationBarButtonFrame: CGRect = CGRect(x: 0, y: 0, width: 48, height: 34)
}

enum Images {
    case calendarIcon
    case closeButtonIcon
    case incomeTypeIconWhite
    case incomeTypeIconBlack
    case expenseTypeIconWhite
    case expenseTypeIconBlack

    static func getImage(_ imageName: Images) -> UIImage {
        switch imageName {
        case .calendarIcon: return UIImage(named: "calendarIcon")!
        case .closeButtonIcon: return UIImage(named: "closeButton")!
        case .incomeTypeIconWhite: return UIImage(named: "incomeTypeIconWhite")!
        case .incomeTypeIconBlack: return UIImage(named: "incomeTypeIconBlack")!
        case .expenseTypeIconWhite: return UIImage(named: "expenseTypeIconWhite")!
        case .expenseTypeIconBlack: return UIImage(named: "expenseTypeIconBlack")!
        }
    }
}


enum Categories: String {
    case food = "Food"
    case transport = "Transport"
    case shopping = "Shopping"
    case communication = "Communication"
    case recreation = "Recreation"
    case sport = "Sport"
    case home = "Home"
    case health = "Health"
    case other = "Other"
    
    static let allValues = [other, food, transport, shopping, communication, recreation, sport, home, health]
    
    static func getCategoryIcon(_ category: Categories) -> UIImage {
        switch category {
        case .food: return UIImage(named: "foodIcon")!
        case .transport: return UIImage(named: "transportIcon")!
        case .shopping: return UIImage(named: "shoppingIcon")!
        case .communication: return UIImage(named: "communicationIcon")!
        case .recreation: return UIImage(named: "recreationIcon")!
        case .sport: return UIImage(named: "sportIcon")!
        case .home: return UIImage(named: "homeIcon")!
        case .health: return UIImage(named: "healthIcon")!
        case .other: return UIImage(named: "otherIcon")!
        }
    }  
}
