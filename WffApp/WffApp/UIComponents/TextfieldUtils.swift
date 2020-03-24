//
//  TextfieldUtils.swift
//  WildFork
//
//  Created by Himanshu Singh on 10/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation

extension LMUnderLinedTextField{
    func isEmptyString() -> Bool{
        
        let characterCount = self.text?.trim.count
        
        guard characterCount ?? 0 > 0 else {
            return true
        }
        
        return false
        
    }
}

enum ValidationMessages:String{
    case invalidPhoneNumber = "Please enter valid mobile number"
    case invalidPassWord = "Password should be minimum 6 character"
    case invalidName = "Name should be minimum 3 character"
    case invalidLastName = "Last Name should be minimum 3 character"
    case invalidEmail = "Please enter valid email address"
    case invalidPinCode = "Please enter valid pincode"
    case invalidAdress = "Please enter valid  address"
    case invalidAge = "Please enter valid age"
    case invalidSalutation = "Enter valid salutation"
    case invalidOccupation = "Please enter valid occupation"
    case invalidCC = "Enter valid CC"
    
    case EmptyPhoneNumber = "Enter Mobile number"
    case EmptyPassWord = "Enter password"
    case EmptyName = "Enter Name"
    case EmptyLastName = "Enter last name"
    case EmptyEmail = "Enter email"
    case EmptyPinCode = "Enter pincode"
    case EmptyAdress = "Enter address"
    case EmptyAge = "Enter Age"
    case EmptySalutation = "Enter salutation"
    case EmptyOccupation = "Enter occupation"
    case EmptyCC = "Enter CC"
}
public enum UserDetailsValidationResult: Int {
    case empty
    case invalid
    case minLength
    case valid
}

public struct ValidationUtil {
    
    private init() {}
    public static let maxMobileNumberLength = 10
    public static let minMobileNumberLength = 7
    public static let maxPasswordLength = 20
    public static let minPasswordLength = 5
    public static let maxNameLength = 100
    public static let minNameLength = 3
    public static let minLastNameLength = 3
    public static let maxLastNameLenght = 45
    public static let maxEmailLength = 100
    public static let maxPinCodeLength = 6
    public static let maxBuildingNumberLenght = 10
    public static let maxLandMarkLength = 200
    public static let maxCityLength = 100
    public static let minOccupationLength = 5
}
