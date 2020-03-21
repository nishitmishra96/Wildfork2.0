//
//  Response.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper


public class Response : NSObject, Mappable{

    var bottomline : Bottomline?
    var groupingData : GroupingData?
    var pagination : Pagination?
    var productTags : AnyObject?
    var products : [YotpoProduct]?
    var reviews : [Review]?
    
    override init() {
        super.init()
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map)
    {
        bottomline <- map["bottomline"]
        groupingData <- map["grouping_data"]
        pagination <- map["pagination"]
        productTags <- map["product_tags"]
        products <- map["products"]
        reviews <- map["reviews"]
        
    }

}
