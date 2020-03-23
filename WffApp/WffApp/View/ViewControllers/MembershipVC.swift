//
//  MembershipVC.swift
//  WFFApp
//
//  Created by Nishit Mishra on 23/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class MembershipVC: UIViewController {

    @IBOutlet weak var qrCodeView: QRCodeView!
    @IBOutlet weak var userName: UILabel!
    private var textForQRCodeView:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = self.textForQRCodeView{
            self.qrCodeView.setQRCode(text:text)
        }
    }
    func setTextForQRCode(text:String?){
        self.textForQRCodeView = text
    }

    @IBAction func addToAppleWallet(_ sender: Any) {
        
    }
}
