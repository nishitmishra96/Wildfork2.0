//
//  AppState.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 24/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
public enum AppState:String {
    case loggedIn = "loggedIn"
    case loggedOut = "loggedOut"
}

public extension UserDefaults{
    
    static var isIntroShown:Bool{
        set{
            UserDefaults.standard.set(true, forKey: "INTROSHOWN")
        }
        get{
            return UserDefaults.standard.value(forKey: "INTROSHOWN") as? Bool ?? false
        }
    }
    static var userZipCode:String?{
        set{
            UserDefaults.standard.setValue(newValue, forKey: "USERZIPCODE")
        }
        get{
            return UserDefaults.standard.value(forKey: "USERZIPCODE") as? String
        }
    }
    
    static var appState:String?{
        set{
            UserDefaults.standard.set(newValue, forKey: AppKeys.appState.rawValue)
        }get{
            return UserDefaults.standard.value(forKey: AppKeys.appState.rawValue) as? String
        }
    }
    
}
