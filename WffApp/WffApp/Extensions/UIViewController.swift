//
//  NavigationController.swift
//  WffApp
//
//  Created by Nishit Mishra on 05/03/20.
//  Copyright © 2020 Nishit Mishra. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    
    func setTitleImage(image:UIImage?){
        let imageView = UIImageView(image:image)
        self.navigationController?.navigationBar.topItem?.titleView = imageView
    }
    func setRightBarButtonItems(items:[UIBarButtonItem]){
        self.navigationController?.navigationBar.topItem?.rightBarButtonItems = items
    }
}
