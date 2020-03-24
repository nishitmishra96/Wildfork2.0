//
//  String.swift
//  WFFApp
//
//  Created by Nishit Mishra on 24/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation

extension String{
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension LMUnderLinedTextField{
    
    
    func isValidPassword() -> UserDetailsValidationResult {
        let characterCount = self.text?.trim.count
        
        guard characterCount ?? 0 > 0 else {
            self.errorMessage = self.placeholder
            ShowErrorUtil.showError(withMessage: ValidationMessages.EmptyPassWord.rawValue)
            return .empty
        }
        
        if (characterCount ?? 0 > ValidationUtil.minPasswordLength){
            return .valid
        }else{
            self.errorMessage = self.placeholder
            ShowErrorUtil.showError(withMessage: ValidationMessages.invalidPassWord.rawValue)
            return .invalid
        }
    }
    
    
    func isValidEmail() -> UserDetailsValidationResult{
        guard self.text?.trim.count ?? 0 > 0 else {
            self.errorMessage = placeholder
            ShowErrorUtil.showError(withMessage: ValidationMessages.EmptyEmail.rawValue)
            return .empty
        }
        
        let regex = "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" + "\\@" + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
            "(" + "\\." + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" + ")+"
        
        
        //        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", regex)
        let result = emailTest.evaluate(with: self.text)
        
        if result{
            return .valid
        }else{
            self.errorMessage = placeholder
            ShowErrorUtil.showError(withMessage: ValidationMessages.invalidEmail.rawValue)
            return .invalid
        }
    }
    }
