//
//  GoogleAnalyticsKeys.swift
//  WildFork
//
//  Created by Himanshu Singh on 24/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation

enum GoogleEventKeys:String{
    case User_Registered_From_App = "User_Registered_From_App"
    case User_Logged_In_From_App = "User_Logged_in_From_App"
    case User_Forgot_Password = "User_Forgot_Password"
    case User_Pressed_Home_Tab = "User_Pressed_Home_Tab"
    case User_Pressed_Reorder_Tab = "User_Pressed_Reorder_Tab"
    case User_Pressed_QR_Tab = "User_Pressed_QRScanner_Tab"
    case User_Pressed_Stores_Tab = "User_Pressed_Stores_Tab"
    case User_Pressed_Account_Tab = "User_Pressed_Account_Tab"
    case Category = "Custom_Event"
    
    var key:String{
        return self.rawValue
    }
}
