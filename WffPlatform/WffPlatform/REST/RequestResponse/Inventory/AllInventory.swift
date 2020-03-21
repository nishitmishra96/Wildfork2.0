//
//  AllInventory.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 16/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper
class AllInventory:NSObject,Mappable{
    public var productId : Int?
    var sku : Int?
    var quantity : Int?
    override init() {
        super.init()
    }
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map)
    {
        productId <- map["product_id"]
        sku <- map["sku"]
        quantity <- map["quantity"]
        
    }
    
}
