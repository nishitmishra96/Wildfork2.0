//
//  SocialLink.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper


class SocialLink : NSObject, Mappable{

    var facebook : String?
    var googleOauth2 : String?
    var linkedin : String?
    var twitter : String?
    
    override init(){
        super.init()
    }
    
    required public init?(map:Map){
        
    }
    
    func mapping(map: Map)
    {
        facebook <- map["facebook"]
        googleOauth2 <- map["google_oauth2"]
        linkedin <- map["linkedin"]
        twitter <- map["twitter"]
        
    }
}
