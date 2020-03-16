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
    func setupCollections(handler:(()->())?){
        Client.shared.fetchCollections(limit: 25, after: self.collections.last?.cursor, productLimit: 8, productCursor: nil) { (collections) in
            self.collections.append(contentsOf: collections?.items ?? [])
            if collections?.hasNextPage ?? false{
                self.setupCollections(handler: handler)
            }else{
                handler?()
            }
        }
    }
    func fetchProductsForCollection(collection:String,cursor:String? = nil,handler:(([ProductViewModel])->())?){
        guard let collectionVM = self.collections.first(where: { (obj) -> Bool in
            return obj.id == collection
        }) else {
            handler?([])
            return
        }
        Client.shared.fetchProducts(in: collectionVM, limit: 25, after: cursor) { (products) in
            if products?.hasNextPage ?? false{
                if let productpage = products{
                    collectionVM.products.appendPage(from: productpage)
                    self.fetchProductsForCollection(collection: collection, cursor: products?.items.last?.cursor, handler: handler)
                }else{
                    handler?(collectionVM.products.items)
                }
            }else{
                handler?(collectionVM.products.items)
            }
        }
    }
}
