//
//  Storyboard.swift
//  WildFork
//
//  Created by Himanshu Singh on 09/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
enum Storyboard: String {
    //    Normal App StoryBoards
    case home = "Home"
    case main = "Main"
    case loginOrSignUp = "LoginOrSignup"

    
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func instanceOf<T: UIViewController>(viewController: T.Type) -> T? {
        let x = String(describing: viewController.self)
        return instance.instantiateViewController(withIdentifier: x) as? T
    }  
}
