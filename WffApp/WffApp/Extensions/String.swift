//
//  String.swift
//  WildFork
//
//  Created by Himanshu Singh on 10/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit

extension String{
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension LMUnderLinedTextField{
    
    
    func isValidPassword() -> ValidationResult {
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
    
    
    func isValidName() -> ValidationResult {
        
        let characterCount = self.text?.trim.count
        
        guard characterCount ?? 0 > 0 else {
            self.errorMessage = self.placeholder
            ShowErrorUtil.showError(withMessage: ValidationMessages.EmptyName.rawValue)
            return .empty
        }
        
        guard characterCount ?? 0 >= ValidationUtil.minNameLength else {
            self.errorMessage = ValidationMessages.invalidName.rawValue
            return .minLength
        }
        
        let nameRegEx = "^[a-zA-Z ]+$"
        let nameTest = NSPredicate(format:"SELF MATCHES %@",nameRegEx)
        let result = nameTest.evaluate(with: self.text)
        
        if result{
            return .valid
        }else{
            self.errorMessage = self.placeholder
            ShowErrorUtil.showError(withMessage: ValidationMessages.invalidName.rawValue)
            return .invalid
        }
    }
    func isValidLastName() -> ValidationResult{
        let characterCount = self.text?.trim.count
        
        guard characterCount ?? 0 > 0 else {
            self.errorMessage = self.placeholder
            ShowErrorUtil.showError(withMessage: ValidationMessages.EmptyLastName.rawValue)
            return .empty
        }
        
        guard characterCount ?? 0 >= ValidationUtil.minLastNameLength else {
            self.errorMessage = placeholder
            return .minLength
        }
        
        let nameRegEx = "^[a-zA-Z ]+$"
        let nameTest = NSPredicate(format:"SELF MATCHES %@",nameRegEx)
        let result = nameTest.evaluate(with: self.text)
        
        if result{
            return .valid
        }else{
            self.errorMessage = placeholder
            ShowErrorUtil.showError(withMessage: ValidationMessages.invalidLastName.rawValue)
            return .invalid
        }
        
    }
    func isValidEmail() -> ValidationResult{
        guard self.text?.trim.count ?? 0 > 0 else {
            self.errorMessage = placeholder
            ShowErrorUtil.showError(withMessage: ValidationMessages.EmptyEmail.rawValue)
            return .empty
        }
        
        let regex = "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" + "\\@" + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
            "(" + "\\." + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" + ")+"
        
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
