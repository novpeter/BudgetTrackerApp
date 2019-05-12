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
    
    static let cellIdentifier: String = "cell"
}

enum Images {
    case calendarIcon
    case closeButtonIcon
    case incomeTypeIconWhite
    case incomeTypeIconBlack
    case expenseTypeIconWhite
    case expenseTypeIconBlack
    case incomeImage

    static func getImage(_ imageName: Images) -> UIImage {
        switch imageName {
        case .calendarIcon: return UIImage(named: "calendarIcon") ?? UIImage()
        case .closeButtonIcon: return UIImage(named: "closeButton") ?? UIImage()
        case .incomeTypeIconWhite: return UIImage(named: "incomeTypeIconWhite") ?? UIImage()
        case .incomeTypeIconBlack: return UIImage(named: "incomeTypeIconBlack") ?? UIImage()
        case .expenseTypeIconWhite: return UIImage(named: "expenseTypeIconWhite") ?? UIImage()
        case .expenseTypeIconBlack: return UIImage(named: "expenseTypeIconBlack") ?? UIImage()
        case .incomeImage: return UIImage(named: "incomeImage") ?? UIImage()
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
        case .food: return UIImage(named: "foodIcon") ?? UIImage()
        case .transport: return UIImage(named: "transportIcon") ?? UIImage()
        case .shopping: return UIImage(named: "shoppingIcon") ?? UIImage()
        case .communication: return UIImage(named: "communicationIcon") ?? UIImage()
        case .recreation: return UIImage(named: "recreationIcon") ?? UIImage()
        case .sport: return UIImage(named: "sportIcon") ?? UIImage()
        case .home: return UIImage(named: "homeIcon") ?? UIImage()
        case .health: return UIImage(named: "healthIcon") ?? UIImage()
        case .other: return UIImage(named: "otherIcon") ?? UIImage()
        }
    }  
}
