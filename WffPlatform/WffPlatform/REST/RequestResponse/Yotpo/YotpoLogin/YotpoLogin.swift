//
//  YotpoLogin.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import ObjectMapper

public class YotpoLogin:NSObject,Mappable{
    public var clientId : String?
    var clientSecret : String?
    var grantType : String?
    override init() {
        super.init()
    }
    
    public convenience init(clientId:String?,clientSecret:String?,grantType:String?){
        self.init()
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.grantType = grantType
    }
    required public init?(map: Map) {
    }
    public func mapping(map: Map)
    {
        clientId <- map["client_id"]
        clientSecret <- map["client_secret"]
        grantType <- map["grant_type"]
    }
    
}
