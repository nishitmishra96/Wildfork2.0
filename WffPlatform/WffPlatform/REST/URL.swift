//
//  URL.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 16/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
extension URL{
    static var isStaging = true
    static var baseurl:URL{
        get{
            return URL(string: "https://6415bcee76af27f9d8034e6b550e25ba:89f1e06e39a01dec63bec6c6c433ae10@wildforkfoods.myshopify.com")!
        }
    }
}
