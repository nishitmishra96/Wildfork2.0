//
//  SendCustomEventsToGoogleAnalytics.swift
//  WildFork
//
//  Created by Himanshu Singh on 24/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation
import FirebaseAnalytics

class SendCustomEventsToGoogleAnalytics{
    class func sendEventToGoogle(category: String,action:String){
        Analytics.logEvent(action, parameters: nil)
    }
}
