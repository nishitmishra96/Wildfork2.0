//
//  MembershipVC.swift
//  WFFApp
//
//  Created by Nishit Mishra on 23/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform
import RxCocoa
import RxSwift
class MembershipVC: UIViewController {

    @IBOutlet weak var qrCodeView: QRCodeView!
    @IBOutlet weak var userName: UILabel!
    private var textForQRCodeView:String?
    private var disposebag = DisposeBag()
    @IBOutlet var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserManager.shared.user.asObservable().subscribe(onNext: { (user) in
            self.userName.text = "\(String(describing: user?.firstName.value))  \(String(describing: user?.lastName.value))"
        })
            .disposed(by: disposebag)
        if let text = self.textForQRCodeView{
            self.qrCodeView.setQRCode(text:text)
        }
    }
    func setTextForQRCode(text:String?){
        self.textForQRCodeView = text
    }

    @IBAction func addToAppleWallet(_ sender: Any) {
        
    }
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
