//
//  RegisterView.swift
//  WildFork
//
//  Created by Himanshu Singh on 01/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit
//import SVProgressHUD

fileprivate enum RegisterViewValidations: String{
    case firstnameempty = "Please fill Correct first Name"
    case lastnameempty = "Please fill Correct last Name"
    case emailempty = "Please fill Correct email"
    case passwordempty = "Please enter a password"
    case confirmpasswordempty = "Please enter confirm password"
    case confirmpasswordnotmatch = "Both passwords doesn't match"
}

class RegisterView: UIView{

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var firstname: LMUnderLinedTextField!
    @IBOutlet weak var lastName: LMUnderLinedTextField!
    @IBOutlet weak var email: LMUnderLinedTextField!
    @IBOutlet weak var password: LMUnderLinedTextField!
    @IBOutlet weak var confirmPassword: LMUnderLinedTextField!
    @IBOutlet weak var checkBox: CheckBox!
    
    @IBAction func SignupButtonPressed(_ sender: Any) {
//        if ViewValidations(){
//            SVProgressHUD.show()
//            UserManager.shared.Registeruser(firstName: /self.firstname.text, lastName: /self.lastName.text, email: /self.email.text, password: /self.password.text,acceptsMarketing: checkBox.isChecked) { (statusCode) -> (Void) in
//                SVProgressHUD.dismiss()
//                if statusCode == HTTPResponseCodes.SuccessfullActivity.key{
//                    ShowErrorUtil.showError(withMessage: "Signup Sucessful")
//                    UserManager.shared.Login(email: /self.email.text, password: /self.password.text, handler: { (statusCode) -> (Void) in
//                        print("Login after signup")
//                    })
//                }else if statusCode == HTTPResponseCodes.UserAlreadyExists.key{
//                    ShowErrorUtil.showError(withMessage: "User Already Exists")
//                }else if statusCode == HTTPResponseCodes.LimitExceeds.key{
//                    ShowErrorUtil.showError(withMessage: "Creating Customer Limit exceeded. Please try again later.")
//                }
//                else{
//                    ShowErrorUtil.showError(withMessage: "Something went wrong")
//                }
//            }
//        }
    }
    
    private func ViewValidations()->Bool{
        guard !firstname.isEmptyString() else
        {
            firstname.errorMessage =  RegisterViewValidations.firstnameempty.rawValue
            ShowErrorUtil.showError(withMessage: RegisterViewValidations.firstnameempty.rawValue )
            return false
        }
        guard !lastName.isEmptyString() else
        {
            lastName.errorMessage =  RegisterViewValidations.lastnameempty.rawValue
            ShowErrorUtil.showError(withMessage: RegisterViewValidations.lastnameempty.rawValue )
            return false
        }
        if email.isValidEmail() == ValidationResult.valid {} else
        {
            email.errorMessage =  RegisterViewValidations.emailempty.rawValue
            ShowErrorUtil.showError(withMessage: RegisterViewValidations.emailempty.rawValue )
            return false
        }
        if  /password.text?.count  < 5{
            password.errorMessage =  RegisterViewValidations.passwordempty.rawValue
            ShowErrorUtil.showError(withMessage: RegisterViewValidations.passwordempty.rawValue )
            return false
        }

        if /password.text?.isEmpty{
            password.errorMessage =  RegisterViewValidations.passwordempty.rawValue
            ShowErrorUtil.showError(withMessage: RegisterViewValidations.passwordempty.rawValue )
            return false
        }
        if /confirmPassword.text?.isEmpty{
            confirmPassword.errorMessage =  RegisterViewValidations.confirmpasswordempty.rawValue
            ShowErrorUtil.showError(withMessage: RegisterViewValidations.confirmpasswordempty.rawValue )
            return false
        }
        if password.text != confirmPassword.text{
            password.errorMessage =  RegisterViewValidations.confirmpasswordnotmatch.rawValue
            confirmPassword.errorMessage = RegisterViewValidations.confirmpasswordnotmatch.rawValue
            ShowErrorUtil.showError(withMessage: RegisterViewValidations.confirmpasswordnotmatch.rawValue )
            return false
        }
        return true
    }

    @IBAction func checkboxPressed(_ sender: Any) {
        
    }
    
    //MARK:- Initialzers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("RegisterView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.firstname.placeholderFont = UIFont.placeholderFont()
        self.lastName.placeholderFont = UIFont.placeholderFont()
        self.email.placeholderFont = UIFont.placeholderFont()
        self.password.placeholderFont = UIFont.placeholderFont()
        self.confirmPassword.placeholderFont = UIFont.placeholderFont()
        self.password.isSecureTextEntry = true
        self.confirmPassword.isSecureTextEntry = true
        self.firstname.lineColor = UIColor.app_gray_text_Color
        self.lastName.lineColor = UIColor.app_gray_text_Color
        self.email.lineColor = UIColor.app_gray_text_Color
        self.password.lineColor = UIColor.app_gray_text_Color
        self.confirmPassword.lineColor = UIColor.app_gray_text_Color
        self.firstname.delegate = self
        self.lastName.delegate = self
        self.email.typeOftextfield = .email
    }
}

extension RegisterView: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                do {
                    let regex = try NSRegularExpression(pattern: "^[^A-Za-z ]+$", options: [])
                    if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                        return false
                    }
                }
                catch {
                    print("ERROR")
                }
            return true
    }
}
