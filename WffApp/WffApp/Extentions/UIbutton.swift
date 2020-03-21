//
//  UIbutton.swift
//  WFFApp
//
//  Created by Himanshu Singh on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

public extension UIButton {

  
    func loadingIndicator(_ show: Bool, indicatorColor: UIColor = .white) {
            let tag = 808404
            if show {
                self.isEnabled = false
                self.alpha = 0.8
                let indicator = UIActivityIndicatorView()
                let buttonHeight = self.bounds.size.height
                let buttonWidth = self.bounds.size.width
                indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
                indicator.tag = tag
                indicator.color = indicatorColor
                self.addSubview(indicator)
                indicator.startAnimating()
            } else {
                self.isEnabled = true
                self.alpha = 1.0
                if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                    indicator.stopAnimating()
                    
                    indicator.removeFromSuperview()
                }
            }
        }
}
class WFFButton: WFFFlatButton{
    override var isEnabled: Bool{
        didSet{
            if self.isEnabled{
                self.alpha = 1
            }else{
                self.alpha = 0.3
            }
        
            
        }
    }
}
