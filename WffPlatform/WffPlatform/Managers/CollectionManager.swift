//
//  CollectionManager.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 07/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import Buy
class CollectionManager {
    static var shared = CollectionManager()
    var collections:[CollectionViewModel] = []
    private init(){
        
    }
    func fetchCollection(collectionid:String,handler:@escaping ((WFFCollection?)->()) ){
        setupCollections{
           let collections = self.collections.filter { (CVM) -> Bool in
                return CVM.id == collectionid
            }
            if let collection = collections.first{
                handler(WFFCollection(viewModel: collection))
            }
            handler(nil)
        }
    }
    func setupCollections(handler:(()->())?){
        if self.collections.count < 1 {
        print("show laoder to sucessfull load")
        Client.shared.fetchCollections(limit: 25, after: self.collections.last?.cursor, productLimit: 0, productCursor: nil) { (collections) in
            self.collections.append(contentsOf: collections?.items ?? [])
            if collections?.hasNextPage ?? false{
                self.setupCollections(handler: handler)
            }else{
                handler?()
            }
        }
        }else{
            handler?()
        }
    }
    func fetchProductsForCollection(collection:String,pagingInfo:pagingStruct? = nil,limit:Int,handler:@escaping (([ResponseProduct],pagingStruct?,Int)->())){
        print("start api hit \(Date())")
        CollectionRestManager.shared.getProductsInCollection(collectionID: collection, paging: pagingInfo, limit: limit) { (response, pageInfo, statusCode) in
            print("end api hit \(Date())")
           let responseList = response?.products ?? []
            handler(responseList,pageInfo,statusCode)
        }
    }
}
