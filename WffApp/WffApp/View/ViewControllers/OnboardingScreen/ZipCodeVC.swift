//
//  ZipCodeVC.swift
//  WFFApp
//
//  Created by Vikas on 20/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class ZipCodeVC: UIViewController {

    @IBOutlet weak var zipCode: LMUnderLinedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
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
