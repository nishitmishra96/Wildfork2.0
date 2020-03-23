//
//  UserManager.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
public class UserManager:NSObject{
    public static var shared = UserManager()
    private var accessToken:String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "USERTOKEN")
        }
        get{
            return UserDefaults.standard.value(forKey: "USERTOKEN") as? String
        }
    }
    public var user:BehaviorRelay<WFFUser?> = BehaviorRelay(value: nil)
    var orders:BehaviorRelay<[OrderViewModel]> = BehaviorRelay(value: [])
    
    private var productCursor:(String?,Bool) = (nil,true)
    
    public private(set) var isDeleveryAvailable:BehaviorRelay<Bool> = BehaviorRelay(value: false)
    public private(set) var userZipCode:BehaviorRelay<String?> = BehaviorRelay(value: nil)
}

extension UserManager{
    func loadUserAndMoreOrders(handler:(()->())?){
        if self.user.value != nil || self.productCursor.1 {
            Client.shared.fetchCustomerAndOrders(after: self.productCursor.0, accessToken: self.accessToken!) { container in
                if let container = container {
                    self.user.accept(WFFUser(custumerVM: container.customer))
                    self.orders.accept(self.orders.value + container.orders.items)
                    self.productCursor.0 = container.orders.hasNextPage ? container.orders.items.last?.cursor : nil
                    self.productCursor.1 = container.orders.hasNextPage
                }
                handler?()
            }
        }else{
            handler?()
        }
    }
    
    func register(email:String,password:String,name:String,lastname:String,acceptsMarketing:Bool){
        Client.shared.register(email: email , password: password, name: name, lastName: lastname, acceptsMarketing: acceptsMarketing){
            (accessToken) in
            self.accessToken = accessToken
        }
    }
    func login(email:String,password:String){
        Client.shared.login(email: email, password: password) { (accessToken) in
            self.accessToken = accessToken
        }
    }
}


//Methods related to Inventory
extension UserManager{
    public func setNewZipCode(zipCode:String,handler:((Bool?,Int)->())?){
        InventoryManager.shared.isProductAvailable(at: zipCode) { (flag,statusCode)  in
            if let responseFlag = flag{
            self.userZipCode.accept(zipCode)
            self.isDeleveryAvailable.accept(responseFlag)
            }
            handler?(flag, statusCode)
        }
    }
}
