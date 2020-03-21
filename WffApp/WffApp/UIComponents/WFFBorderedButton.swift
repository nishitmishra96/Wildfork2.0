//
//  WFFBorderedButton.swift
//  WFFApp
//
//  Created by Vikas on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
class WFFBorderedButton : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.appGrey.cgColor
        self.titleLabel?.font = UIFont.appTitleBold(ofSize: .small)
    }
}
