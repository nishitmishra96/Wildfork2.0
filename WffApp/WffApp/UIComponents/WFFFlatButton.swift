//
//  WFFFlatButton.swift
//  WFFApp
//
//  Created by Vikas on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
class WFFFlatButton : UIButton{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.appGrey
        self.titleLabel?.textColor = UIColor.white
        self.titleLabel?.font = UIFont.appTitleBold(ofSize: .small)
    }
}
