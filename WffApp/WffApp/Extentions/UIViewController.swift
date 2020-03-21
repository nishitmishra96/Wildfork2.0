//
//  UIViewController.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//
import UIKit
public extension UIViewController {
    
    
    func adjustScrollingInsets(){
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
        
    }
    
    //Left to Right
    func pushViewController(_ viewController:UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = .reveal
        transition.subtype = CATransitionSubtype.fromRight
        transition.isRemovedOnCompletion = true
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(viewController, animated: false)
        
        
    }
    
    // Right to Left
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func dissmissNavigationController(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func popToViewController(_ viewController : UIViewController){
        
        self.navigationController?.popToViewController(viewController, animated: false)
        
    }
    
    
}

//
public extension CAShapeLayer {
    func drawCircleAtLocation(location: CGPoint, withRadius radius: CGFloat, andColor color: UIColor, filled: Bool) {
        fillColor = filled ? color.cgColor : UIColor.white.cgColor
        strokeColor = color.cgColor
        let origin = CGPoint(x: location.x - radius, y: location.y - radius)
        path = UIBezierPath(ovalIn: CGRect(origin: origin, size: CGSize(width: radius * 2, height: radius * 2))).cgPath
    }
}

private var handle: UInt8 = 0

public extension UIBarButtonItem {
    private var badgeLayer: CAShapeLayer? {
        if let b: AnyObject = objc_getAssociatedObject(self, &handle) as AnyObject? {
            return b as? CAShapeLayer
        } else {
            return nil
        }
    }
    
    func addBadge(number: Int, withOffset offset: CGPoint = CGPoint.zero, andColor color: UIColor = UIColor.red, andFilled filled: Bool = true) {
        guard let view = self.value(forKey: "view") as? UIView else { return }
        
        badgeLayer?.removeFromSuperlayer()
        
        // Initialize Badge
        let badge = CAShapeLayer()
        let radius = CGFloat(7)
        let location = CGPoint(x: view.frame.width - (radius + offset.x), y: (radius + offset.y))
        badge.drawCircleAtLocation(location: location, withRadius: radius, andColor: color, filled: filled)
        view.layer.addSublayer(badge)
        
        // Initialiaze Badge's label
        let label = CATextLayer()
        label.string = "\(number)"
        label.alignmentMode = CATextLayerAlignmentMode.center
        label.fontSize = 11
        label.frame = CGRect(origin: CGPoint(x: location.x - 4, y: offset.y), size: CGSize(width: 8, height: 16))
        label.foregroundColor = filled ? UIColor.white.cgColor : color.cgColor
        label.backgroundColor = UIColor.clear.cgColor
        label.contentsScale = UIScreen.main.scale
        badge.addSublayer(label)
        
        // Save Badge as UIBarButtonItem property
        objc_setAssociatedObject(self, &handle, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func updateBadge(number: Int) {
        if let text = badgeLayer?.sublayers?.filter({ $0 is CATextLayer }).first as? CATextLayer {
            text.string = "\(number)"
        }
    }
    
    func removeBadge() {
        badgeLayer?.removeFromSuperlayer()
    }
}
enum ValidationResult{
    case empty
    case valid
    case invalid
}
extension String{
func isValidEmail() -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
    return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
}
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
//    func isValidEmail() -> ValidationResult{
//         guard self.text?.trim.count ?? 0 > 0 else {
//             self.errorMessage = placeholder
//             ShowErrorUtil.showError(withMessage: ValidationMessages.EmptyEmail.rawValue)
//             return .empty
//         }
//
//         let regex = "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" + "\\@" + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
//             "(" + "\\." + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" + ")+"
//
//         let emailTest = NSPredicate(format:"SELF MATCHES %@", regex)
//         let result = emailTest.evaluate(with: self.text)
//
//         if result{
//             return .valid
//         }else{
//             self.errorMessage = placeholder
//             ShowErrorUtil.showError(withMessage: ValidationMessages.invalidEmail.rawValue)
//             return .invalid
//         }
//     }
}
extension LMUnderLinedTextField{
    func isValidPassword() -> Bool {
            let characterCount = self.text?.trim.count
            
            guard characterCount ?? 0 > 0 else {
                //self.errorMessage = self.placeholder
                //ShowErrorUtil.showError(withMessage: ValidationMessages.EmptyPassWord.rawValue)
                return false
            }
        if characterCount ?? 0 > 6{
            return true
        }
        else{
            return false
        }
            
    //        if (characterCount ?? 0 > ValidationUtil.minPasswordLength){
    //            return true
    //        }else{
    //            //self.errorMessage = self.placeholder
    //            //ShowErrorUtil.showError(withMessage: ValidationMessages.invalidPassWord.rawValue)
    //            //return .invalid
    //            return false
    //        }
        }
        func isValidName() -> Bool {
            
            let characterCount = self.text?.trim.count
            
            guard characterCount ?? 0 > 0 else {
                self.errorMessage = self.placeholder
                //ShowErrorUtil.showError(withMessage: ValidationMessages.EmptyName.rawValue)
                return false
            }
            
//            guard characterCount ?? 0 >= ValidationUtil.minNameLength else {
//                //self.errorMessage = ValidationMessages.invalidName.rawValue
//                //return .minLength
//                return false
//            }
            
            let nameRegEx = "^[a-zA-Z ]+$"
            let nameTest = NSPredicate(format:"SELF MATCHES %@",nameRegEx)
            let result = nameTest.evaluate(with: self.text)
            
            if result{
                //return .valid
                return true
            }else{
                //self.errorMessage = self.placeholder
                //ShowErrorUtil.showError(withMessage: ValidationMessages.invalidName.rawValue)
                //return .invalid
                return false
            }
        }
        func isValidLastName() -> Bool{
            let characterCount = self.text?.trim.count
            
            guard characterCount ?? 0 > 0 else {
                self.errorMessage = self.placeholder
                //ShowErrorUtil.showError(withMessage: ValidationMessages.EmptyLastName.rawValue)
                //return .empty
                return false
            }
    //
    //        guard characterCount ?? 0 >= ValidationUtil.minLastNameLength else {
    //            self.errorMessage = placeholder
    //            return .minLength
    //        }
            
            let nameRegEx = "^[a-zA-Z ]+$"
            let nameTest = NSPredicate(format:"SELF MATCHES %@",nameRegEx)
            let result = nameTest.evaluate(with: self.text)
            
            if result{
                return true
            }else{
    //            self.errorMessage = placeholder
    //            ShowErrorUtil.showError(withMessage: ValidationMessages.invalidLastName.rawValue)
                return false
            }
            
        }
}
