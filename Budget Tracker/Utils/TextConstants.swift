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
    static let Difference = "Difference"
    static let ShowDetailedStatistic = "Show detailed statistic"
}

struct Placeholders {
    static let Email = "Email"
    static let Password = "Password"
    static let ConfirmPassword = "ConfirmPassword"
    static let Name = "Name"
    static let Title = "Title"
    static let Comment = "Comment"
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
    static let Password = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,16}"
}

struct AlertTitles {
    static let GenericError = "Something went wrong"
    static let CheckAllFields = "Check all fields"
    static let WrongName = "Wrong name"
    static let WrongEmail = "Wrong email"
    static let WrongPassword = "Wrong password"
    static let PasswordReciepe = "Password should contain one letter, one special symbol, one digit and lenght more than 6"
    static let PasswordsNotMatch = "Passwords do not match"
    static let Done = "Done!"
    static let PasswordWasSent = "The password was sent on "
}

struct URLConstants {
    static let baseURLString = "https://budget-tracker-web-server.azurewebsites.net/api"
//    static let baseURLString = "https://localhost:5001/api"
}

struct AuthType {
    static let Regular = "Regular"
    static let Google = "Goolgle"
}
