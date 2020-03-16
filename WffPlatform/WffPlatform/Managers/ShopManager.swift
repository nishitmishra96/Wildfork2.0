//
//  ShopManager.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 07/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
public protocol ShopManagerDataSource{
    func HomePageRemoteConfig(handler: ((String?)->())? )
}
public final class ShopManager {
    public static var shared = ShopManager()
    @objc dynamic public var categories:[String] = []
    public var datasource:ShopManagerDataSource?
    private init() {
        
    }
    func makeShopReady(ready: @escaping (()->())){
        if CollectionManager.shared.collections.count == 0{
            CollectionManager.shared.setupCollections {
                ready()
            }
        }else{
            ready()
        }
    }
    public func fetchProductsForCollection(collectionID:String,handler: @escaping (([WFFProduct])->()) ){
        makeShopReady {
            CollectionManager.shared.fetchProductsForCollection(collection: collectionID) { (products) in
                handler(products.map { (productVM) -> WFFProduct in
                    return WFFProduct(productViewModel: productVM)
                })
            }
        }
    }
    public func fetchCollection(byNameMatching:String? = nil , byId:String? = nil ,handler:@escaping (([WFFCollection])->())){
        makeShopReady {
            var localCollection = CollectionManager.shared.collections
            if let searchString = byNameMatching{
                localCollection = CollectionManager.shared.collections.filter { (collection) -> Bool in
                    return collection.title.lowercased().contains(searchString.lowercased())
                }
            }
            if let id = byId{
                localCollection = localCollection.filter { (collection) -> Bool in
                    return collection.id == id
                }
            }
            handler(localCollection.map({ (viewModel) -> WFFCollection in
                return WFFCollection(viewModel: viewModel)
            }))
        }
    }
}

extension ShopManager{
    public func fetchAllCategories(handler:(([ProductCategories]?)->())?){
        self.datasource?.HomePageRemoteConfig(handler: { (json) in
            if let jsonData = json?.data(using: .utf8) {
                do{
                let categories = try JSONDecoder().decode([ProductCategories].self, from: jsonData)
                handler?(categories)
                }catch{
                    handler?(nil)
                }
            }
        })
    }
}
