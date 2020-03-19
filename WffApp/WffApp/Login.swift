//
//  Login.swift
//  WFFApp
//
//  Created by Vikas on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class Login: UIViewController {

    
    @IBOutlet weak var email: LMUnderLinedTextField!
    
    @IBOutlet weak var password: LMUnderLinedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: Any) {
         let registerVC = UIStoryboard.init(name: "StartFlow", bundle: .main).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
           self.navigationController?.pushViewController(registerVC, animated: true)
        
    }
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if email.text == ""{
            errorAlert(msg : "Enter your email")
        }
        else if password.text == "" {
            errorAlert(msg: "Enter your password")
        }
        else{
            
        }
    }
    func errorAlert(msg : String){
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)

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

