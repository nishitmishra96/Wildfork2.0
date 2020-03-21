//
//  UIFont.swift
//  WFFApp
//
//  Created by Vikas on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
enum fontFamily{
    case title
    case subtitle
}
enum fontSize{
    case small
    case medium
    case large
}
extension UIFont{
    
    static var appSubtitleFont: UIFont{
        get{
            return UIFont(name: "Montserrat-Light", size: 10)!
        }
    }
    static var appTitleFont: UIFont{
        get{
            return UIFont(name: "Oswald-Bold", size: 16)!
        }
    }
    static func getFontSize(customFamily : fontFamily, size : fontSize) -> CGFloat{
        switch(customFamily){
        case .title where size == .small:
            return 12.0
        case .title where size == .medium:
            return 16.0
        case .title where size == .large:
            return 18.0
        case .subtitle where size == .small:
            return 10.0
        case .subtitle where size == .medium:
            return 14.0
        case .subtitle where size == .large:
            return 18.0
        default:
            return 10.0
        }
    }
    static func appTitleBold(ofSize: fontSize) -> UIFont{
        
        return UIFont(name: "Oswald-Bold", size: getFontSize(customFamily : .title, size : ofSize))!
    }
    static func appTitleRegular(ofSize: fontSize) -> UIFont{
        return UIFont(name: "Oswald-Regular", size: getFontSize(customFamily : .title, size : ofSize))!
    }
    static func appSubTitleLight(ofSize: fontSize) -> UIFont{
           return UIFont(name: "Montserrat-Light", size: getFontSize(customFamily : .subtitle, size : ofSize))!
       }
    static func appSubTitleBold(ofSize: fontSize) -> UIFont{
        return UIFont(name: "Montserrat-Medium", size: getFontSize(customFamily : .subtitle, size : ofSize))!
    }
    static func appSubTitleLightItalic(ofSize: fontSize) -> UIFont{
        return UIFont(name: "Montserrat-LightItalic", size: getFontSize(customFamily : .subtitle, size : ofSize))!
    }
    
    
}
