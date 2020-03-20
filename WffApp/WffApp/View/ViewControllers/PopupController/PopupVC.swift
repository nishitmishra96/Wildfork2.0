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
    var zipcode : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let zip = zipcode{
            popupTitle.text = "WE DON'T DELIVER TO \(zip)"
        }
        
        // Do any additional setup after loading the view.
//        let customView = productUnavailable().loadNib() as! productUnavailable
//        popUpView.addSubview(customView)
    }
    @IBAction func continueWithoutShoppingPressed(_ sender: Any) {
        
    }
    @IBAction func changeZipPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
//extension UIView {
//    /** Loads instance from nib with the same name. */
//    func loadNib() -> UIView {
//        let bundle = Bundle(for: type(of: self))
//        let nibName = type(of: self).description().components(separatedBy: ".").last!
//        let nib = UINib(nibName: nibName, bundle: bundle)
//        return nib.instantiate(withOwner: self, options: nil).first as! UIView
//    }
//}
