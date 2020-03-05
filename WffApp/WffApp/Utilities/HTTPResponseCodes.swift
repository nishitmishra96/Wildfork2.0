//
//  HTTPResponseCodes.swift
//  WildFork
//
//  Created by Himanshu Singh on 21/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation

enum HTTPResponseCodes:Int{
    case SuccessfullActivity = 201
    case WrongCredentialsEntered = 200
    case UserAlreadyLoggedIn = 300
    case UserIsUnidentified = 301
    case UserAlreadyExists = 409
    case WrongEmailRegistered = 500
    case LimitExceeds = 501
    case SomethingWentWrong = 1000
    
    var key: Int{
        return self.rawValue
    }
    
}
