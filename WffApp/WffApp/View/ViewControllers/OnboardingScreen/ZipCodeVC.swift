//
//  ZipCodeVC.swift
//  WFFApp
//
//  Created by Vikas on 20/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform
class ZipCodeVC: UIViewController {

    @IBOutlet weak var loginRegisterButton: UIButton!
    @IBOutlet weak var startShoppingButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var zipCode: LMUnderLinedTextField!
    @IBOutlet weak var loginSignupStackView:UIStackView!
    @IBOutlet weak var messagLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.zipCode.delegate = self
        self.messagLabel.text = "ENTER ZIP CODE TO GET STARTED"
    }
    func isGoodZipCodeView(){
        self.zipCode.isTextFieldEnabled = true
        self.messagLabel.text = "WE DELIVER TO \(self.zipCode.text ?? "YOUR ZIP")"
        self.submitButton.isHidden = true
        self.loginSignupStackView.isHidden = false
    }
    func emptyZipCodeView(){
        self.submitButton.isHidden = false
        self.loginSignupStackView.isHidden = true
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        
        return
        let popupVC = UIStoryboard.init(name: "StartFlow", bundle: .main).instantiateViewController(withIdentifier: "PopupVC") as! PopupVC
        popupVC.zipcode = zipCode.text
        self.present(popupVC, animated: true, completion: nil)
    }
    
    @IBAction func startShoppingPressed(_ sender: UIButton) {
        
    }
    @IBAction func loginRegisterPressed(_ sender: UIButton) {
        let loginVC = UIStoryboard.init(name: "StartFlow", bundle: .main).instantiateViewController(withIdentifier: "Login") as! Login
            pushViewController(loginVC)
    }

}
extension ZipCodeVC:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        emptyZipCodeView()
        if textField.text?.count ?? 0 < 4 {
            self.submitButton.isEnabled = false
        }else{
            self.submitButton.isEnabled = true
        }
        if textField.text?.count ?? 0 > 5 && string != ""{
            return false
        }
        return true
    }
}
