//
//  ForgotPasswordVC.swift
//  WildFork
//
//  Created by Himanshu Singh on 22/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit

fileprivate enum ForgotPasswordMessages:String{
    case emailFieldEmpty = "Please enter the Email to continue"
}

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var email: LMUnderLinedTextField!
    @IBOutlet weak var cancelButton: UIButton!
        @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cancelButton.layer.borderWidth = 1
//        email.placeholderFont = UIFont.placeholderFont()
        contentView.layer.cornerRadius = 5
    }

    @IBAction func submitPressed(_ sender: Any) {
        if self.ViewValidations(){
//            UserManager.shared.ForgotPassword(email: /email.text) { (statusCode,message) in
//                if statusCode == HTTPResponseCodes.LimitExceeds.key || statusCode == HTTPResponseCodes.WrongEmailRegistered.key || statusCode == HTTPResponseCodes.SuccessfullActivity.key{
//                    ShowErrorUtil.showError(withMessage: /message)
//                }else{
//                    ShowErrorUtil.showError(withMessage: /message)
//                }
//
//            }
        }

    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func ViewValidations()->Bool{

//        if email.isValidEmail() == ValidationResult.valid {} else
//        {
//            email.errorMessage =  ForgotPasswordMessages.emailFieldEmpty.rawValue
//            ShowErrorUtil.showError(withMessage: ForgotPasswordMessages.emailFieldEmpty.rawValue )
//            return false
//        }
        return true
    }
}
