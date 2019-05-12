//
//  TextConstants.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

struct Titles {
    static let appNameTopPart = "Budget"
    static let appNameBottomPart = "Tracker"
    static let statistics = "Statistics"
    static let difference = "Difference:"
    static let showDetailedStatistic = "Show detailed statistic"
    static let lastOperations = "Last operations"
    static let total = "Total"
    static let comment = "Comment"
    static let title = "Title"
    static let income = "Income"
}

struct Placeholders {
    static let email = "Email"
    static let password = "Password"
    static let confirmPassword = "ConfirmPassword"
    static let name = "Name"
    static let title = "Title"
    static let comment = "Comment"
    static let zeroSum = "0 " + Currency.rubble
}

struct ButtonTitles {
    static let signUp = "Sign up"
    static let signIn = "Sign in"
    static let forgotPassword = "Forgot password?"
    static let googleSignIn = "via Google account"
    static let add = "Add"
    static let synchronize = "Synchronize"
    static let logOut = "Log out"
    static let back = "back"
    static let income = "Income"
    static let expense = "Expense"
}

struct Regex {
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let password = "[0-9a-zA-Z]{8,20}"
}

enum AlertTitles: String {
    case genericError = "Oops..."
    case wrongName = "Wrong name"
    case wrongEmail = "Wrong email"
    case wrongPassword = "Wrong password"
    case done = "Done!"
}

enum AlertSubTitles: String {
    case genericError = "Something went wrong"
    case passwordReciepe = "Password should contain one upper case and lower case letter, one digit and lenght more than 8"
    case passwordWasSent = "The password was sent on entered email"
    case checkAllFields = "Check all fields"
    case synchronizeComplete = "All data was synchronize"
    case passwordsNotMatch = "Passwords do not match"
    case empty = ""
    case signUpError = "Sign up error. Please, try later"
    case signInError = "Sign in error. Please, try later"
    case syncError = "Cannot synchtonize now. Please, try later"
    case logOutError = "Cannot log out now. Please, check internet connection"
}

struct URLConstants {
    static let baseURLString = "https://budget-tracker-web-server.azurewebsites.net/api"
}

struct AuthType {
    static let regular = "Regular"
    static let google = "Google"
}

struct Currency {
    static let rubble = "₽"
}

struct MainScreenMock {
    static let income = "120650 " + Currency.rubble
    static let expense = "32450 " + Currency.rubble
    static let difference = "88200 " + Currency.rubble
}
