//
//  Collection.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 07/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
public class WFFCollection: NSObject {
    let cursor:      String
    public let id:          String
    public let title:       String
    public let collectionDiscription: String
    let imageURL:    URL?
    public var products :BehaviorRelay<[WFFProduct]> = BehaviorRelay(value: [])
    private var pagingInfo:pagingStruct?
    init(viewModel:CollectionViewModel) {
        self.cursor = viewModel.cursor
        self.id = viewModel.id
        self.title = viewModel.title
        self.collectionDiscription = viewModel.description
        self.imageURL = viewModel.imageURL
    }
    func getMoreProducts(limit:Int=25,handler: ((Int)->())? ){
        CollectionManager.shared.fetchProductsForCollection(collection: self.id, pagingInfo: self.pagingInfo, limit: limit) { (newProducts, pagingStruct, statusCode) in
            if let pageinfo = pagingStruct{
                self.pagingInfo = pageinfo
            }
//            var newList = self.products.value
//            newList = newList + newProducts
//            self.products.accept(newList)
            handler?(statusCode)
        }
    }
}
extension String{
    func getBase64EncodedString()->String{
        return String(data:  Data(base64Encoded: self)!, encoding: .utf8)!
    }
}
