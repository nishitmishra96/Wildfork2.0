//
//  UIButton.swift
//  WFFApp
//
//  Created by Nishit Mishra on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: titleLabel?.bounds.width ?? 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left:imageView?.bounds.width ?? 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}
