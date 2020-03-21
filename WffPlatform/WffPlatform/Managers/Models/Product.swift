//
//  Product.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 07/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
//1 piece
//approx 2.5 LB | ($4.38/LB)
//$10.95
public class WFFProduct: NSObject {
    var id:       String?
    public var title:    String?
    public var summary:  String?
    public var pieces:    String?
    public var weight:String?
    public var pricePerWeight:String?
    public var totalPrice:String?
    public var rationOutofFive:Int?
    var images : [URL]?
    public override init() {
        super.init()
        
    }
}
