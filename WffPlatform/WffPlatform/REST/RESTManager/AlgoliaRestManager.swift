//
//  AlgoliaRestManager.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import Moya
class AlgoliaRestManager: NSObject {
    static var shared = AlgoliaRestManager()
    private var provider = MoyaProvider<AlgoliaAPI>()
    func getProductsfromCollection(collectionHandle:String){
        provider.request(.getProducts(collectionHandle: collectionHandle, limit: 10, Offset: 0, sortingOrder: .popular)) { (response) in
            switch response{
            case .success(let result):
                print(try! result.mapString())
            case .failure(let error):
                print("FUCKED")
            }
        }
    }
}
