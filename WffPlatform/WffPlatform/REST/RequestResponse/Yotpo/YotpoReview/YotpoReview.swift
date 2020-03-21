//
//  YotpoReview.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper

public class YotpoReview : NSObject,Mappable{

    public var response : Response?
    public var status : Status?
    override init() {
        super.init()
    }
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map)
    {
        response <- map["response"]
        status <- map["status"]
        
    }
}
