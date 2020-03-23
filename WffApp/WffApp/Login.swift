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
    @IBOutlet weak var loginButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerPressed(_ sender: Any) {
        let registerVC = Storyboard.start.instanceOf(viewController: RegisterVC.self)!
        pushViewController(registerVC)
    }
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        let forgotPasswordVC = Storyboard.start.instanceOf(viewController: ForgotPasswordVC.self)!
        forgotPasswordVC.modalPresentationStyle = .fullScreen
        forgotPasswordVC.modalTransitionStyle = .crossDissolve
        self.present(forgotPasswordVC,animated: true,completion: nil)
        
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let homeVC = Storyboard.home.instanceOf(viewController: HomeVC.self)!
        pushViewController(homeVC)
    }
    private func ViewValidations()->Bool{
        return true
    }
}

