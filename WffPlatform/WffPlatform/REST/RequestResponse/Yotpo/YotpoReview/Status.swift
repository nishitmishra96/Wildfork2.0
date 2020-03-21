//
//  Response.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper


public class Status : NSObject, Mappable{

    var code : Int?
    var message : String?

    override init() {
        super.init()
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map)
    {
        code <- map["code"]
        message <- map["message"]
    }
}
