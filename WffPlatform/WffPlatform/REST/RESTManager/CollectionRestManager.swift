//
//  CollectionRestManager.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 16/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import Moya
public struct pagingStruct{
    var hasNext:Bool
    var nextPageInfo:String
    init(withLink:String?) {
        if let link = withLink{
            hasNext = true
//            Some logic to find pageInfo
            nextPageInfo = link
        }else{
            hasNext = false
            nextPageInfo = ""
            
        }
    }
}
public class CollectionRestManager: NSObject {
    private var provider = MoyaProvider<ShopiFYAPI>()
    public static var shared = CollectionRestManager()
    public func start(){
        AlgoliaRestManager.shared.getProductsfromCollection(collectionHandle: "4th-of-july-bbq")
    }
    
    func getProductsInCollection(collectionID:String,paging:pagingStruct?,limit:Int,handler: @escaping ((ProductListResponse?,pagingStruct?,Int)->()) ){
        let collection_id = (paging?.hasNext ?? false) ? nil : collectionID
        provider.request(.getProducts(collectionID: collection_id, pageInfo: paging?.nextPageInfo, limit: limit)) { (response) in
            switch response {
            case .success(let result):
                do{
                    let headerLink = result.response?.allHeaderFields["Link"] as? String
                    let jsonString =  try result.mapString()
                    if let responseList = ProductListResponse(JSONString: jsonString){
                        handler(responseList,pagingStruct(withLink: headerLink),result.statusCode)
                    }else{
                        print("CollectionRestManager getProducts failed in mapping")
                        handler(nil,nil,result.statusCode)
                    }
                }catch{
                    handler(nil,nil,result.statusCode)
                    print("CollectionRestManager getProducts failed in catch")
                }
            case .failure(let error):
                print(error)
                handler(nil,nil,error.response?.statusCode ?? 0)
            }
        }
    }
    
    func getProductInfo(id:String,handler:@escaping ((ResponseProduct?,Int)->()) ){
        provider.request(.getProductInfo(productId: id)) { (response) in
            switch response{
            case .success(let result):
                do{
                    let jsonString = try result.mapJSON() as? [String:Any]
                    var product: ResponseProduct?
                    if let productDic = jsonString?["product"] as? [String:Any]{
                        product = ResponseProduct(JSON: productDic)
                    }
                    handler(product,result.statusCode)
                }
                catch{
                    handler(nil,result.statusCode)
                }
            case .failure(let error):
                handler(nil,error.response?.statusCode ?? 0)
            }
        }
    }
}
