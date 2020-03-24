//
//  WFFLabels.swift
//  WFFApp
//
//  Created by Vikas on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
class WFFSubtitleLabel : UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.appSubTitleLight(ofSize: .medium)
        self.textColor = UIColor.appGrey
    }
}
class WFFLargeTextLabel:UILabel{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.appSubTitleLight(ofSize: .large)
        self.textColor = UIColor.appGrey
    }
}
class WFFTextLabel : UILabel{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.appTextRegular(ofSize: .medium)
        self.textColor = UIColor.appGrey
    }
}
class WFFTitleLabel : UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.appTitleBold(ofSize: .large)
        self.textColor = UIColor.appGrey
    }
}
class WFFMediumTitleLabel:UILabel{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.appTitleBold(ofSize: .medium)
        self.textColor = UIColor.appGrey
    }
}
class WFFSmallLabel : UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.appSubTitleLight(ofSize: .small)
        self.textColor = UIColor.appGrey
    }
}
