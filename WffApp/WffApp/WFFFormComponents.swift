//
//  WFFFormComponents.swift
//  WFFApp
//
//  Created by Vikas on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit

class WFFCheckBox: UIButton {

    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(UIImage(imageLiteralResourceName: "checkboxfilled"), for: UIControl.State.normal)
            } else {
                self.setImage(UIImage(imageLiteralResourceName: "checkboxblank"), for: UIControl.State.normal)
            }
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
class WFFBorderedButton : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
}
