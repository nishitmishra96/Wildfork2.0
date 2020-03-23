//
//  UItextfield.swift
//  WFFApp
//
//  Created by Nishit Mishra on 24/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class BorderedTextField:UITextField{
    override func awakeFromNib() {
        self.borderStyle = .line
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.appGrey.cgColor
    }
}
