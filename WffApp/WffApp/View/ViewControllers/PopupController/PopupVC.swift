//
//  PopupVC.swift
//  WFFApp
//
//  Created by Vikas on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform
class PopupVC: UIViewController {

    @IBOutlet weak var popupSubtitle: UILabel!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var textField: BorderedTextField!
    @IBOutlet weak var verifyZipcode: WFFFlatButton!
    @IBOutlet weak var continueWithoutShopping: WFFFlatButton!
    @IBOutlet weak var changeZipcode: WFFBorderedButton!
    var continuePressed : (()->())?
    var zipcode : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let zip = zipcode{
            popupTitle.text = "WE DON'T DELIVER TO \(zip)"
        }
        textField.isHidden = true
        verifyZipcode.isHidden = true
    }
    
    @IBAction func dismissPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func verifyZipcode(_ sender: Any) {
        UserManager.shared.setNewZipCode(zipCode: self.textField.text ?? "") { (newValue, statusCode) in
            switch statusCode{
            case 200:
                self.popupTitle.text = "WE DELIVER TO \(self.textField.text ?? "YOUR PINCODE")"
                UserDefaults.userZipCode = self.textField.text ?? ""
            case 0:
                self.showNoInterNetConnectionAlert(withMessage: "Hit retry to find delivery again, after connecting to Internet") {
                }
            case 404:
                let popupVC = Storyboard.start.instanceOf(viewController: PopupVC.self)!
                popupVC.zipcode = self.textField.text
                self.popupTitle.text = "WE DONOT DELIVER TO \(self.textField.text ?? "YOUR PINCODE")"
                UserDefaults.userZipCode = nil
            default:
                print("DEFAULT: NEED TO INSPECT CODE")
            }
        }
    }
    @IBAction func continueWithoutShoppingPressed(_ sender: Any) {
        if let _ = UserDefaults.standard.value(forKey: AppKeys.userSawHome.rawValue){
        }else{
            continuePressed?()
        }
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func changeZipPressed(_ sender: Any) {
        self.continueWithoutShopping.isHidden = true
        self.changeZipcode.isHidden = true
        self.textField.isHidden = false
        self.verifyZipcode.isHidden = false
        self.popupTitle.text = "WELCOME TO WILDFORK"
        self.popupSubtitle.text = "Please enter your zipcode so we can serve you better"        
    }
}
