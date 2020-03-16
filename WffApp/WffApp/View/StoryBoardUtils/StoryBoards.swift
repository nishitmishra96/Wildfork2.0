//
//  StoryBoards.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//
import UIKit
import Foundation

enum Storyboard: String {
//    Normal App StoryBoards
    case home = "Home"
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func instanceOf<T: UIViewController>(viewController: T.Type) -> T? {
       let x = String(describing: viewController.self)
        return instance.instantiateViewController(withIdentifier: x) as? T
    }
}


