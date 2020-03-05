//
//  UIApplication.swift
//  WildFork
//
//  Created by Himanshu Singh on 22/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
extension UIApplication {
    
    static func topViewController() -> UIViewController? {
        guard var top = shared.keyWindow?.rootViewController else {
            return nil
        }
        while let next = top.presentedViewController {
            top = next
        }
        return top
    }
 
    public   func appVersion() -> String? {
        return "\(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String) \(Bundle.main.infoDictionary!["CFBundleVersion"]!)"
    }

    public   func appBuild() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }

    public func openURL(_ url: String) {

        if let customURL = URL(string: url) {

            let application:UIApplication = UIApplication.shared

            if (application.canOpenURL(customURL)) {

                if #available(iOS 10.0, *) {
                    application.open(customURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    UIApplication.shared.openURL(customURL)
                }
            }
            else {
                print("Cannot Open URL : \(url)")
            }
        }
    }
}
