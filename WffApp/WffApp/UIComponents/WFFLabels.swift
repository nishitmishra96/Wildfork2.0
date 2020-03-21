//
//  WFFLabels.swift
//  WFFApp
//
//  Created by Vikas on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
class WFFSubtitle : UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.appSubtitleFont
    }
}
class WFFTitle : UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.appTitleFont
    }
}
