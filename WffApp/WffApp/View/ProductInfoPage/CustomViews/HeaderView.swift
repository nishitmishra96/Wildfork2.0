//
//  HeaderView.swift
//  WFFApp
//
//  Created by Nishit Mishra on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//
//
//import UIKit
//
//class HeaderView: UITableViewHeaderFooterView {
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
//     private func commonInit(){
//        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
//        addSubview(mainContainer)
//        mainContainer.frame = self.bounds
//        mainContainer.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        let segment = SWSegmentedControl(items: ["Ratings","Question"])
//    }
//
//}
