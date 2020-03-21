//
//  UIAlertController.swift
//  WFFApp
//
//  Created by Himanshu Singh on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    func showNoInterNetConnectionAlert(withMessage:String?,retryHandler:(()->())?){
        let alert = UIAlertController(title: "No Internet !", message: withMessage, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        let retry = UIAlertAction(title: "Retry", style: .destructive) { (_) in
            retryHandler?()
        }
        alert.addAction(dismiss)
        alert.addAction(retry)
        present(alert, animated: true, completion: nil)
    }
}
