//
//  ProductProtocol.swift
//  WFFApp
//
//  Created by Vikas on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
protocol Product {
    var name : String {get set}
    var thumnail : URL {get set}
    var price : Double {get set}
    var costPerUnit : Double{get set}
    var ratingCount : Int {get set}
    var weight :  Double{get set}
    var pieceCount : Int{get set}
    var isInUserBasket : Bool{get set}
    var isAvailable : Bool{get set}
}
