//
//  CollectionAPI.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 16/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import Moya
enum ShopiFYAPI{
//    Collection api
    case getCollectionDetails(collectionID:String)
    case getCollections(pageInfo:String?,limit:Int)
    
// products
    case getProducts(collectionID:String?,pageInfo:String?,limit:Int)
    case getProductInfo(productId:String)
}
extension ShopiFYAPI:PluginType{
    
}
extension ShopiFYAPI:TargetType{
    var baseURL: URL {
        return URL.baseurl
    }
    
    var path: String {
        switch self {
        case .getCollectionDetails(collectionID: let collectionid):
            return "/admin/api/2020-01/collections/\(collectionid).json"
        case .getCollections(pageInfo: _, limit: _):
            return "/admin/api/2019-07/collections.json"
        case .getProductInfo(productId: let productid):
            return "/admin/api/2020-01/products/\(productid).json"
        case .getProducts(collectionID: _, pageInfo: _, limit: _):
            return "/admin/api/2019-07/products.json"
        }
    }
    
    var method:Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getCollectionDetails(collectionID:_):
            return .requestPlain
        case .getCollections(pageInfo: let pageInfo, limit: let limit):
            var params = ["limit":"\(limit)"]
            if let page = pageInfo{
                params["page_info"] = page
            }
            return .requestCompositeData(bodyData: Data(), urlParameters: params)
        case .getProductInfo(productId: _):
            return .requestPlain
        case .getProducts(collectionID: let collectionID, pageInfo: let pageInfo, limit: let limit):
            var params = ["limit":"\(limit)"]
            params["collection_id"] = collectionID
            if let page = pageInfo{
                params["collection_id"] = nil
                params["page_info"] = page
            }
            return .requestCompositeData(bodyData: Data(), urlParameters: params)
        }
    }
    
    var headers: [String : String]?{
        return nil
    }
    
}
