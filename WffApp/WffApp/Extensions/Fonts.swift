//
//  Fonts.swift
//  WildFork
//
//  Created by Himanshu Singh on 01/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit
import Foundation
public enum FontSize : Int{
    case largeTextFont = 20
    case basicTitleTextFont = 16
    case basicTextFont  = 14
    case smallTextFont  = 12
    case ultralargeTextFont = 24
}
public struct Fonts {
    
    private init() {}
    public static let medium  = "HelveticaNeue-Medium"
    public static let placeholderFont = "Montserrat-Light"
}



public extension UIFont {
    
    class func appFont(size: FontSize) -> UIFont{
        return UIFont(name: Fonts.medium, size: CGFloat(size.rawValue))!
    }
    class func placeholderFont(size: FontSize = .basicTitleTextFont)-> UIFont{
        return UIFont(name: Fonts.placeholderFont, size: CGFloat(size.rawValue))!
    }
    
    
}


