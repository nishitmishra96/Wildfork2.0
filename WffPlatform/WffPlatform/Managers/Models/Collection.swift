//
//  Collection.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 07/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

public class WFFCollection: NSObject {
    let cursor:      String
    public let id:          String
    public let title:       String
    let collectionDiscription: String
    let imageURL:    URL?
    public var product : [WFFProduct]
    init(viewModel:CollectionViewModel) {
        self.cursor = viewModel.cursor
        self.id = viewModel.id
        self.title = viewModel.title
        self.collectionDiscription = viewModel.description
        self.imageURL = viewModel.imageURL
        self.product = viewModel.products.items.map({ (obj) -> WFFProduct in
            return WFFProduct(productViewModel:obj)
        })
    }
}
