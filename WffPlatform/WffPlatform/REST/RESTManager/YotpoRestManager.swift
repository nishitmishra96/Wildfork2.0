//
//  YotpoRestManager.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 18/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import Moya
class YotpoRestManager: NSObject {
    private var provider = MoyaProvider<ApiCollection>()
    static var shared = YotpoRestManager()
    
   private func yotpoLogin(handler:@escaping ((YotpoLoginResponse?,Int)->())){
    provider.request(.yotpoLogin(login:URLGenerator.shared.yotpCredentials)) { (response) in
            switch response{
            case .success(let result):
                do{
                    let responseString = try result.mapString()
                    handler(YotpoLoginResponse(JSONString: responseString),result.statusCode)
                }catch{
                    handler(nil,result.statusCode)
                    print("failed To Login into yotpo")
                }
            case .failure(let error):
                handler(nil,error.response?.statusCode ?? 0)
                print("failed To Login into yotpo")
            }
        }
    }
    func getYotpoReviewFor(productId:String,handler:@escaping ((YotpoReview?,Int)->())){
        provider.request(.getReviewByProductId(productId: productId)) { (response) in
            switch response{
                case .success(let result):
                    do{
                        let responseString = try result.mapString()
                        handler(YotpoReview(JSONString: responseString),result.statusCode)
                    }catch{
                        handler(nil,result.statusCode)
                    }
                case .failure(let error):
                    handler(nil,error.response?.statusCode ?? 0)
            }
        }
    }
}
