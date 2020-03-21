//
//  URLGenerator.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 16/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation

public class URLGenerator:NSObject{
    static public var shared = URLGenerator()
    var isStaging = false
    var apiKey = "6415bcee76af27f9d8034e6b550e25ba"
    var password = "89f1e06e39a01dec63bec6c6c433ae10"
    var yotpoClientId = "YhsUbDm42GmrdheiV0hhSa7YWNORp6dhA7VJScUe"
    private var yotpoClientSecret = "3YvY0X77IqvHekKj19j57EbZapHFWPGIsi4VAHTL"
    private var yotpoGrantType = "client_credentials"
    var yotpCredentials:YotpoLogin{
        return YotpoLogin(clientId: yotpoClientId, clientSecret: yotpoClientSecret, grantType: yotpoGrantType)
    }
    var baseURL : String{
        if isStaging{
            return ""
        }else{
            return  "https://\(apiKey):\(password)@wildforkfoods.myshopify.com"
        }
    }
    var yotpoBaseURL:String{
        return "https://api.yotpo.com"
    }
    var availabilityBaseURL :String{
        return "https://wildforkfoods.com"
    }
}
