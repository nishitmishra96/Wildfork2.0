//
//  BottomLine.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper


class Bottomline : NSObject, Mappable{

    var averageScore : Float?
    var customFieldsBottomline : AnyObject?
    var organicAverageScore : Int?
    var starDistribution : StarDistribution?
    var totalOrganicReviews : Int?
    var totalReview : Int?

    override init(){
        super.init()
    }
    
    required public init?(map:Map){
        
    }

    func mapping(map: Map)
    {
        averageScore <- map["average_score"]
        customFieldsBottomline <- map["custom_fields_bottomline"]
        organicAverageScore <- map["organic_average_score"]
        starDistribution <- map["star_distribution"]
        totalOrganicReviews <- map["total_organic_reviews"]
        totalReview <- map["total_review"]
        
    }
}
