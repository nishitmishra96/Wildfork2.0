//
//  ViewController.swift
//  WildFork
//
//  Created by Himanshu Singh on 24/09/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit
import WebKit
//import CocoaLumberjack
//import IQKeyboardManagerSwift
class LoginOrRegisterVC:WFFViewController {
    
    @IBOutlet weak var loginView: LoginView!
    @IBOutlet weak var registerView: RegisterView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        self.setViewForLogin()
    }
    @IBAction func RegisterButtonPressed(_ sender: Any) {
        self.setViewForRegister()
    }

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        
        super.viewDidLoad()
        setViewForLogin()
        contentView.backgroundColor = UIColor.app_text_black_Color
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    func makeTextfieldsEmpty(){
        (loginView)?.emailTextField.text = ""
        (loginView)?.passwordTextField.text = ""
        (registerView)?.firstname.text = ""
        (registerView)?.lastName.text = ""
        (registerView)?.email.text = ""
        (registerView)?.password.text = ""
        (registerView)?.confirmPassword.text = ""
    }
    func setViewForLogin(){
        registerView.isHidden = true
        registerButton.setTitleColor(UIColor.white, for: .normal)
        registerButton.backgroundColor = .clear
        loginView.isHidden = false
        loginButton.backgroundColor = .white
        loginButton.setTitleColor(UIColor.app_text_black_Color, for: .normal)
    }
    
    func setViewForRegister(){
        loginView.isHidden = true
        loginButton.backgroundColor = .clear
        loginButton.setTitleColor(UIColor.white, for: .normal)
        registerView.isHidden = false
        registerButton.backgroundColor = .white
        registerButton.setTitleColor(UIColor.app_text_black_Color, for: .normal)
    }
}
