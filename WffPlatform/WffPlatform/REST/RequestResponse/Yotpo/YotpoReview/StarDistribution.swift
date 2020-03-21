//
//  StarDistribution.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper


class StarDistribution : NSObject, Mappable{

    var one : Int?
    var two : Int?
    var three : Int?
    var four : Int?
    var five : Int?


    override init(){
    }
    
    required public init?(map:Map){
        
    }
    
    func mapping(map: Map)
    {
        one <- map["1"]
        two <- map["2"]
        three <- map["3"]
        four <- map["4"]
        five <- map["5"]
    }
}
