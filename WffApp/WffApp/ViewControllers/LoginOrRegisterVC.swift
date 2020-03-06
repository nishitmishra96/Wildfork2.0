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
class LoginOrRegisterVC:BaseViewController {
    
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
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setViewForLogin()
        contentView.backgroundColor = UIColor.app_text_black_Color
        self.setTitleImage(image: UIImage(named: "wffLogo"))
        setButtonItems()
    }
    
    func setButtonItems(){
        self.setRightBarButtonItems(items: [UIBarButtonItem.init(image: UIImage(named: "search"), style: .done, target: self, action: #selector(searchPressed))])
    }
    
    @objc func searchPressed(){
        print("ald;lkas")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        super.viewDidLoad()

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
