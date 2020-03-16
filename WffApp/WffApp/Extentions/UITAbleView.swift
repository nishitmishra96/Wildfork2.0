//
//  UITAbleView.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
extension UITableView {

func registerCellClass(_ cellClass: AnyClass) {
    let identifier = String.className(cellClass)
    self.register(cellClass, forCellReuseIdentifier: identifier)
}

func registerCellNib(_ cellClass: AnyClass) {
    let identifier = String.className(cellClass)
    let nib = UINib(nibName: identifier, bundle: nil)
    self.register(nib, forCellReuseIdentifier: identifier)
}
}
extension String{
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
