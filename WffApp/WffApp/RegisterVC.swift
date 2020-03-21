//
//  RegisterVC.swift
//  WFFApp
//
//  Created by Vikas on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var password: LMUnderLinedTextField!
    @IBOutlet weak var email: LMUnderLinedTextField!
    @IBOutlet weak var lastName: LMUnderLinedTextField!
    @IBOutlet weak var firstName: LMUnderLinedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func checkButtonPressed(_ sender: Any) {
        
    }
    @IBAction func signupPressed(_ sender: Any) {
        
    }
    
    @IBAction func loginPressed(_ sender: Any) {
       popViewController()
    }
    func errorAlert(msg : String){
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)

    }
    
    
}
