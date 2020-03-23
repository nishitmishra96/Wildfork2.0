//
//  WFFUser.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
public class WFFUser: NSObject {
    public var firstName:BehaviorRelay<String?> = BehaviorRelay(value: nil)
    public var lastName:BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var email:BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var id:BehaviorRelay<String?> = BehaviorRelay(value: nil)
    public var fullName : String? {
        return "\(firstName.value ?? "") \(lastName.value ?? "")"
    }
    
    init(custumerVM:CustomerViewModel) {
        self.firstName.accept(custumerVM.firstName)
        self.lastName.accept(custumerVM.lastName)
        self.email.accept(custumerVM.email)
        self.id.accept(custumerVM.id)
    }
}
