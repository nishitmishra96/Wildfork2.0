//
//  UICollectionView.swift
//  WFFApp
//
//  Created by Vikas on 20/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionView
{
    func registerCollectionViewCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
}

