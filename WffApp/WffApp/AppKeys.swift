//
//  UserDefaultKeys.swift
//  WildFork
//
//  Created by Himanshu Singh on 11/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation

enum AppKeys : String{
    case userSawHome = "UserSawHome"
    case userLoggedIn = "UserIsLoggedIn"
    case APP_OPENED_COUNT = "AppOpenedCount"
    case RatedTheApp = "UserRatedTheApp"
    case NoThanks = "UserDontWantToRateTheApp"
    case RemindMeLater = "UserWantsToRateAppLater"
    case LaunchTime = "LaunchTime"
    case RatingPopUpCount = "RatingPopUpCount"
    case WFFCookieKey = "custom_view"
    case WFFCookieValue = "applabb"
    var key : String{
        return self.rawValue
    }
}
