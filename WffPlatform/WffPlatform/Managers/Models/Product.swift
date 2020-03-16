//
//  Product.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 07/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

public class WFFProduct: NSObject {
    let cursor:   String
    let id:       String
    public let title:    String
    let summary:  String
    public let price:    String
    let images : [URL]
    init(productViewModel:ProductViewModel) {
        self.cursor = productViewModel.cursor
        self.id = productViewModel.id
        self.title = productViewModel.title
        self.summary = productViewModel.summary
        self.price = productViewModel.price
        self.images = productViewModel.images.items.map({ (obj) -> URL in
            return obj.url
        })
    }
}
