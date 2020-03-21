//
//  User.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper


public class YotpoUser : NSObject, Mappable{

    public var displayName : String?
    public var isSocialConnected : Int?
    public var socialImage : String?
    public var userId : Int?
    public var userType : String?
    
    override init() {
         super.init()
     }
     
     required public init?(map: Map) {
     }
    
    public func mapping(map: Map)
    {
        displayName <- map["display_name"]
        isSocialConnected <- map["is_social_connected"]
        socialImage <- map["social_image"]
        userId <- map["user_id"]
        userType <- map["user_type"]
        
    }

}
