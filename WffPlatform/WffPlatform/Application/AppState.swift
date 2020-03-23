//
//  AppState.swift
//  WffPlatform
//
//  Created by Nishit Mishra on 24/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
    enum State {
        case unregistered
        case loggedIn(WFFUser)
        case sessionExpired(WFFUser)
    }
