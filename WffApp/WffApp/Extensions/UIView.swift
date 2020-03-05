//
//  UIView.swift
//  WildFork
//
//  Created by Himanshu Singh on 01/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    var height:CGFloat{
        get{
            return self.frame.height - (self.safeAreaInsets.bottom + self.safeAreaInsets.top)
        }
    }
    var width:CGFloat{
        get{
            return self.frame.width - (self.safeAreaInsets.right + self.safeAreaInsets.left)
        }
    }
}

public extension UIView {
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

