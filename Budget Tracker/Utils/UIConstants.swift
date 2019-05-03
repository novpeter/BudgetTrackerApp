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
    case CalendarIcon
    case CloseButtonIcon
    case IncomeTypeIconWhite
    case IncomeTypeIconBlack
    case ExpenseTypeIconWhite
    case ExpenseTypeIconBlack

    static func getImage(_ imageName: Images) -> UIImage {
        switch imageName {
        case .CalendarIcon: return UIImage(named: "calendarIcon")!
        case .CloseButtonIcon: return UIImage(named: "closeButton")!
        case .IncomeTypeIconWhite: return UIImage(named: "incomeTypeIconWhite")!
        case .IncomeTypeIconBlack: return UIImage(named: "incomeTypeIconBlack")!
        case .ExpenseTypeIconWhite: return UIImage(named: "expenseTypeIconWhite")!
        case .ExpenseTypeIconBlack: return UIImage(named: "expenseTypeIconBlack")!
        }
    }
}


enum Categories: String {
    case Food = "Food"
    case Transport = "Transport"
    case Shopping = "Shopping"
    case Communication = "Communication"
    case Recreation = "Recreation"
    case Sport = "Sport"
    case Home = "Home"
    case Health = "Health"
    case Other = "Other"
    
    static let allValues = [Other, Food, Transport, Shopping, Communication, Recreation, Sport, Home, Health]
    
    static func getCategoryIcon(_ category: Categories) -> UIImage {
        switch category {
        case .Food: return UIImage(named: "foodIcon")!
        case .Transport: return UIImage(named: "transportIcon")!
        case .Shopping: return UIImage(named: "shoppingIcon")!
        case .Communication: return UIImage(named: "communicationIcon")!
        case .Recreation: return UIImage(named: "recreationIcon")!
        case .Sport: return UIImage(named: "sportIcon")!
        case .Home: return UIImage(named: "homeIcon")!
        case .Health: return UIImage(named: "healthIcon")!
        case .Other: return UIImage(named: "otherIcon")!
        }
    }  
}
