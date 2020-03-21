//
//  UIImage.swift
//  WFFApp
//
//  Created by Himanshu Singh on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
extension UIImage {
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    func setImageColor(color: UIColor)->UIImage {
        let templateImage = self.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        return templateImage
    }
   
}
