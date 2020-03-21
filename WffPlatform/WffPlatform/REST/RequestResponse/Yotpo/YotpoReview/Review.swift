//
//  Review.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper


public class Review : NSObject, Mappable{

    public var content : String?
    public var createdAt : String?
    public var customFields : AnyObject?
    public var id : Int?
    public var productId : Int?
    public var score : Int?
    public var sentiment : Float?
    public var sourceReviewId : AnyObject?
    public var title : String?
    public var user : YotpoUser?
    public var verifiedBuyer : Bool?
    public var votesDown : Int?
    public var votesUp : Int?

    override init() {
         super.init()
     }
     
     required public init?(map: Map) {
     }
    
    public func mapping(map: Map)
    {
        content <- map["content"]
        createdAt <- map["created_at"]
        customFields <- map["custom_fields"]
        id <- map["id"]
        productId <- map["product_id"]
        score <- map["score"]
        sentiment <- map["sentiment"]
        sourceReviewId <- map["source_review_id"]
        title <- map["title"]
        user <- map["user"]
        verifiedBuyer <- map["verified_buyer"]
        votesDown <- map["votes_down"]
        votesUp <- map["votes_up"]
        
    }

}
