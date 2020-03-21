//
//  Product.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper


public class YotpoProduct : NSObject, Mappable{

    var domainKey : String?
    var embeddedWidgetLink : String?
    var id : Int?
    var imageUrl : String?
    var name : String?
    var productLink : String?
    var socialLinks : SocialLink?
    var testimonialsProductLink : String?

    override init()
    {
        super.init()
    }
    
    required public init?(map:Map){
        
    }

    public func mapping(map: Map)
    {
        domainKey <- map["domain_key"]
        embeddedWidgetLink <- map["embedded_widget_link"]
        id <- map["id"]
        imageUrl <- map["image_url"]
        name <- map["name"]
        productLink <- map["product_link"]
        socialLinks <- map["social_links"]
        testimonialsProductLink <- map["testimonials_product_link"]
        
    }

}
