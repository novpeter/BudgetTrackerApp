//
//  TextConstants.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

struct Titles {
    static let AppNameTopPart = "Budget"
    static let AppNameBottomPart = "Tracker"
    static let Statistics = "Statistics"
    static let Difference = "Difference:"
    static let ShowDetailedStatistic = "Show detailed statistic"
}

struct Placeholders {
    static let Email = "Email"
    static let Password = "Password"
    static let ConfirmPassword = "Confirm password"
    static let Name = "Name"
    static let Title = "Title"
    static let Comment = "Comment"
    static let ZeroSum = "0 " + Currency.Rubble
}

struct ButtonTitles {
    static let SignUp = "Sign up"
    static let SignIn = "Sign in"
    static let ForgotPassword = "Forgot password?"
    static let GoogleSignIn = "via Google account"
    static let Add = "Add"
    static let Synchronize = "Synchronize"
    static let LogOut = "Log out"
    static let Back = "back"
    static let Income = "Income"
    static let Expense = "Expense"
}

struct Regex {
    static let Email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let Password = "[0-9a-zA-Z]{8,20}"
}

enum AlertTitles: String {
    case GenericError = "Oops..."
    case WrongName = "Wrong name"
    case WrongEmail = "Wrong email"
    case WrongPassword = "Wrong password"
    case Done = "Done!"
}

enum AlertSubTitles: String {
    case GenericError = "Something went wrong"
    case PasswordReciepe = "Password should contain one upper case and lower case letter, one digit and lenght more than 8"
    case PasswordWasSent = "The password was sent on entered email"
    case CheckAllFields = "Check all fields"
    case SynchronizeComplete = "All data was synchronize"
    case PasswordsNotMatch = "Passwords do not match"
    case Empty = ""
    case SignUpError = "Sign up error. Please, try later"
    case SignInError = "Sign in error. Please, try later"
    case SyncError = "Cannot synchtonize now. Please, try later"
    case LogOutError = "Cannot log out now. Please, check internet connection"
}

struct URLConstants {
    static let baseURLString = "https://budget-tracker-web-server.azurewebsites.net/api"
}

struct AuthType {
    static let Regular = "Regular"
    static let Google = "Google"
}

struct Currency {
    static let Rubble = "₽"
}

struct MainScreenMock {
    static let Income = "120650 " + Currency.Rubble
    static let Expense = "32450 " + Currency.Rubble
    static let Difference = "88200 " + Currency.Rubble
}
