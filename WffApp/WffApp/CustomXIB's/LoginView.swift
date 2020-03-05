//
//  Login.swift
//  WildFork
//
//  Created by Himanshu Singh on 01/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit

fileprivate enum LoginViewValidations: String{
    case emailempty = "Please fill Correct email"
    case passwordempty = "Please enter a password"
}

class LoginView: UIView {

    @IBOutlet weak var emailTextField: LMUnderLinedTextField!
    @IBOutlet weak var passwordTextField: LMUnderLinedTextField!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var loginResponse: UILabel!
    @IBAction func LoginButtonPressed(_ sender: Any) {
        if ViewValidations(){
    }
    }
    
    @IBAction func ForgotPasswordButtonPressed(_ sender: Any) {
        var forgotPasswordVC = Storyboard.home.instanceOf(viewController: ForgotPasswordVC.self)
        forgotPasswordVC?.modalPresentationStyle = .overCurrentContext
        forgotPasswordVC?.modalTransitionStyle = .crossDissolve
        UIApplication.topViewController()?.present(forgotPasswordVC!, animated: true, completion: nil)
        
    }
    
    private func ViewValidations()->Bool{

        if emailTextField.isValidEmail() == ValidationResult.valid {} else
        {
            emailTextField.errorMessage =  LoginViewValidations.emailempty.rawValue
            ShowErrorUtil.showError(withMessage: LoginViewValidations.emailempty.rawValue )
            return false
        }
        
        if /passwordTextField.text?.isEmpty{
            passwordTextField.errorMessage =  LoginViewValidations.passwordempty.rawValue
            ShowErrorUtil.showError(withMessage: LoginViewValidations.passwordempty.rawValue )
            return false
        }
        return true
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
        Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.emailTextField.typeOftextfield = .email
        self.emailTextField.placeholderFont = UIFont.placeholderFont()
        self.passwordTextField.placeholderFont = UIFont.placeholderFont()
        self.passwordTextField.isSecureTextEntry = true
        self.emailTextField.lineColor = UIColor.app_gray_text_Color
        self.passwordTextField.lineColor = UIColor.app_gray_text_Color
        
    }
}
