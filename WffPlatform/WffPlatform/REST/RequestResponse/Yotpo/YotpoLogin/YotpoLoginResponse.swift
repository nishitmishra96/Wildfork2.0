//
//  YotpoLoginResponse.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper

public class YotpoLoginResponse:NSObject,Mappable{
    var accessToken : String?
    var tokenType   : String?
    override init() {
        super.init()
    }
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map)
    {
        accessToken <- map["access_token"]
        tokenType <- map["token_type"]
    }
}
