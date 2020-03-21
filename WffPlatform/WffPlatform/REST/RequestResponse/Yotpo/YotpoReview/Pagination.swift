//
//  Pagination.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper


public class Pagination : NSObject, Mappable{

    var page : Int?
    var perPage : Int?
    var total : Int?


    override init(){
        super.init()
    }
    
    required public init?(map:Map){
    
    }
    

    public func mapping(map: Map)
    {
        page <- map["page"]
        perPage <- map["per_page"]
        total <- map["total"]
        
    }
}
