//
//  InventoryRestManager.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 18/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import Moya

class InventoryManager: NSObject {
    static var shared = InventoryManager()
    private var provider = MoyaProvider<ApiCollection>()
    private var userZipCode:String?
    private var isDeleveryAvailable:Bool?
    override init() {
        super.init()
        
    }
    func isProductAvailable(at ZipCode:String,handler:@escaping ((Bool)->()) ){
//        if userZipCode != nil && isDeleveryAvailable != nil{
//            handler(isDeleveryAvailable ?? false)
//        }else{
        self.getAvailability(zipcode: ZipCode) { (avalability, statusCode) in
            self.userZipCode = ZipCode
            self.isDeleveryAvailable = avalability
            handler(avalability)
        }
//        }
    }
    private func getAvailability(zipcode:String,handler:@escaping ((Bool,Int)->())){
        provider.request(.checkAvailability(zipCode: zipcode)) { (response) in
            switch response{
            case .success(let result):
                print("success")
                do{
                    let responseDic = try result.mapJSON() as? [String:Any]
                    if (responseDic?["store"] as? [String:Any]) != nil{
                        handler(true , result.statusCode)
                    }else{
                        handler(false,result.statusCode)
                    }
                }catch{
                    handler(false,result.statusCode)
                }
            case .failure(let error):
                handler(false,error.response?.statusCode ?? 0)
                print("failure")
            }
        }
    }
    
}
