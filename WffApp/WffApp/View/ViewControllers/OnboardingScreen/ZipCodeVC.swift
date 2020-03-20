//
//  ZipCodeVC.swift
//  WFFApp
//
//  Created by Vikas on 20/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class ZipCodeVC: UIViewController {

    @IBOutlet var loginRegisterButton: UIButton!
    @IBOutlet var startShoppingButton: UIButton!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet weak var zipCode: LMUnderLinedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        loginRegisterButton.isHidden = true
        startShoppingButton.isHidden = true
        submitButton.isHidden = false
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
//        loginRegisterButton.isHidden = false
//        startShoppingButton.isHidden = false
//        submitButton.isHidden = true
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
