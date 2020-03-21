//
//  AlgoliaAPI.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import Moya

fileprivate enum AlgoliaRequest{
    case getProducts(colelctionhandle:String,limit:Int,offset:Int)
    
    func getRequestBody()->String{
        switch self {
        case .getProducts(colelctionhandle: let handle,limit:let limit,offset:let offset):
            return "{\"params\":\"facets=%5B%22*%22%5D&page=\(offset)&hitsPerPage=\(limit)&attributesToRetrieve=%5B%22handle%22%2C%22id%22%2C%22image%22%2C%2C%22objectID%22%2C%2C%22price%22%2C%22title%22%2C%22url%22%2C%5D&filters=collections%3A\(handle)\"}"
            
        }
    }
}

enum AlgoliaSort{
    case popular
    case priceDes
    case priceAes
    case titleDes
    case titleAes
}
enum AlgoliaAPI{
    case getProducts(collectionHandle:String,limit:Int,Offset:Int,sortingOrder:AlgoliaSort)
}
extension AlgoliaAPI:TargetType{
    var baseURL: URL {
        switch self {
        case .getProducts(collectionHandle: _, limit: _, Offset: _, sortingOrder: _):
            return URL(string:"https://668rb43gd4-dsn.algolia.net")!
        }
    }
    
    var path: String {
        switch self {
        case .getProducts(collectionHandle: _, limit: _, Offset: _, sortingOrder: let sortOrder):
            var sortingKey : String = ""
            switch sortOrder {
            case .popular:
                sortingKey = "shopify_products_recently_ordered_count_desc"
            case .priceAes:
                sortingKey = "shopify_products_price_asc"
            case .priceDes:
                sortingKey = "shopify_products_price_desc"
            case .titleAes:
                sortingKey = "shopify_products_title_asc"
            case .titleDes:
                sortingKey = "shopify_products_title_desc"
            }
            return "/1/indexes/\(sortingKey)/query"
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProducts(collectionHandle: _, limit: _, Offset: _, sortingOrder: _):
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getProducts(collectionHandle: let handle, limit: let limit, Offset: let offset, sortingOrder: _):
            let requestBody = AlgoliaRequest.getProducts(colelctionhandle: handle, limit: limit, offset: offset)
            let data = requestBody.getRequestBody().data(using: .utf8)
            let urlParams = ["x-algolia-application-id":"668RB43GD4","x-algolia-api-key":"a5614ec56dacbabba45a05067fbbc1b2"]
            return .requestCompositeData(bodyData: data!, urlParameters: urlParams)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    
}
