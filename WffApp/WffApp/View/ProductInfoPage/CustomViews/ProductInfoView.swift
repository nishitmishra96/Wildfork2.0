//
//  ProductInfoView.swift
//  WFFApp
//
//  Created by Himanshu Singh on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class ProductInfoView: UIView {
    @IBOutlet weak var contentView:UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("ProductInfoView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
