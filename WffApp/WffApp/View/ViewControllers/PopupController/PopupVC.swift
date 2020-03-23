//
//  PopupVC.swift
//  WFFApp
//
//  Created by Vikas on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class PopupVC: UIViewController {

    @IBOutlet weak var popupSubtitle: UILabel!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var textField: BorderedTextField!
    @IBOutlet weak var verifyZipcode: WFFFlatButton!
    @IBOutlet weak var continueWithoutShopping: WFFFlatButton!
    
    @IBOutlet weak var changeZipcode: WFFBorderedButton!
    var zipcode : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let zip = zipcode{
            popupTitle.text = "WE DON'T DELIVER TO \(zip)"
        }
        textField.isHidden = true
        verifyZipcode.isHidden = true
    }
    @IBAction func verifyZipcode(_ sender: Any) {
        
    }
    @IBAction func continueWithoutShoppingPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func changeZipPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            
            self.continueWithoutShopping.isHidden = true
            self.changeZipcode.isHidden = true
            self.textField.isHidden = false
            self.verifyZipcode.isHidden = false
        }
    }
    
    
    

}
