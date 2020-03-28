//
//  ShopManager.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 07/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
public protocol ShopManagerDataSource{
    func HomePageRemoteConfig(handler: ((String?)->())? )
}
public final class ShopManager {
    public static var shared = ShopManager()
    @objc dynamic public var categories:[String] = []
    public var isDeleveryAvailable:BehaviorRelay<Bool> = BehaviorRelay(value: false)
    public var datasource:ShopManagerDataSource?
    private init() {
        
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
                    print("Failed to map")
                    handler?(nil)
                }
            }
        })
    }
}
