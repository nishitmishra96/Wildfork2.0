//
//  APIProvider.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 16/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import Moya

//https://wildforkfoods.com/apps/wildfox/locate_store?zip_code=33304&distance=20
enum ApiCollection{
    case getInventoryItems
    case getReviewByProductId(productId:String)
    case yotpoLogin(login:YotpoLogin)
    case checkAvailability(zipCode:String)
}
extension ApiCollection:PluginType{
   
}
extension ApiCollection:TargetType{
    var baseURL: URL {
        switch self{
        case .checkAvailability(zipCode: _):
            return URL(string: URLGenerator.shared.availabilityBaseURL)!
        case .getReviewByProductId,.yotpoLogin:
            return URL(string: URLGenerator.shared.yotpoBaseURL)!
        default:
            return URL(string: URLGenerator.shared.baseURL)!
        }
    }
    
    var path: String {
        switch self{
        case .getInventoryItems:
            return "/search"
        case .getReviewByProductId(let productId):
            return "/v1/widget/\(URLGenerator.shared.yotpoClientId)/products/\(productId)/reviews.json"
        case .yotpoLogin(_):
            return "/oauth/token"
        case .checkAvailability:
            return "/apps/wildfox/locate_store"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getInventoryItems,.getReviewByProductId,.checkAvailability:
            return .get
        
        case .yotpoLogin:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getInventoryItems:
            return .requestCompositeData(bodyData: Data(), urlParameters: ["view":"inventory","q":"9012"])
        case .getReviewByProductId(_):
            return .requestPlain
        case .yotpoLogin(let login):
            return .requestCompositeParameters(bodyParameters: login.toJSON(), bodyEncoding: JSONEncoding.default, urlParameters: [:])
        case .checkAvailability(let zipCode):
            return .requestCompositeData(bodyData: Data(), urlParameters: ["zip_code":zipCode,"distance":20])
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    var sampleData: Data {
        return Data()
    }
}
