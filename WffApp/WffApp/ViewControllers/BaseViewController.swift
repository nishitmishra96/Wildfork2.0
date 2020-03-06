//
//  BaseViewController.swift
//  WffApp
//
//  Created by Nishit Mishra on 06/03/20.
//  Copyright © 2020 Nishit Mishra. All rights reserved.
//

import Foundation
import UIKit
class BaseViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
    }
}
