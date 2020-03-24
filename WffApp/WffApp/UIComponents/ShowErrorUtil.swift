//
//  ShowErrorUtil.swift
//  WildFork
//
//  Created by Himanshu Singh on 10/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
public class ShowErrorUtil: NSObject {
    public class func showError(withMessage:String){
        UIApplication.shared.keyWindow?.endEditing(true)
        let snack = SnackBar(message: withMessage, duration: .middle)
        snack.bottomMargin = 45
        snack.shouldDismissOnSwipe = true
        snack.show()
    }
}

