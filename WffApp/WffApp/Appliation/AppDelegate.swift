//
//  AppDelegate.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform
import FirebaseRemoteConfig
import Firebase
import IQKeyboardManagerSwift

@UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var remoteConfig:RemoteConfig?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true

//        FirebaseApp.configure()
//        remoteConfig = RemoteConfig.remoteConfig()
//        let settings = RemoteConfigSettings()
//        settings.minimumFetchInterval = 0
//        remoteConfig?.configSettings = settings
//        ShopManager.shared.datasource = self
        //Enter production Product Id
        
        // Override point for customization after application launch.
        return true
    }
}

//extension AppDelegate:ShopManagerDataSource{
//    func HomePageRemoteConfig(handler: ((String?) -> ())?) {
//
//        remoteConfig?.fetch { (result, err) in
//        self.remoteConfig?.activate { (er) in
//             let string = self.remoteConfig?.configValue(forKey: "categories").stringValue
//            handler?(string)
//         }
//     }
//
//    }
//}
