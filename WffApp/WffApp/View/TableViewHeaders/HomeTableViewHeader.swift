//
//  HomeTableViewHeader.swift
//  WFFApp
//
//  Created by Vikas on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform
import RxSwift
import RxCocoa
protocol DeleveryViewDelegate{
    func didtapOnChangeZipCode()
}
class HomeTableViewHeader: UIView {
    var delegate:DeleveryViewDelegate?
    @IBOutlet private weak var truckIcon: UIImageView!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var contentView:UIView!
    private var disposebag = DisposeBag()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        bindWithViewModel()
//        self.truckIcon.isHidden = UserManager.shared.isDeleveryAvailable.value
//        self.messageLabel.attributedText = self.getDeliveryString(isDeliveryAvailable: UserManager.shared.isDeleveryAvailable.value, zipCode: UserManager.shared.userZipCode.value ?? "")
    }
    private func bindWithViewModel(){
        UserManager.shared.userZipCode.asObservable()
            .subscribe(onNext: { (newZip) in
                self.messageLabel.attributedText = self.getDeliveryString(isDeliveryAvailable: UserManager.shared.isDeleveryAvailable.value, zipCode: newZip)
            })
            .disposed(by: disposebag)
        UserManager.shared.isDeleveryAvailable.asObservable()
            .subscribe(onNext: { (newValue) in
                self.truckIcon.isHidden = !UserManager.shared.isDeleveryAvailable.value
            })
            .disposed(by: disposebag)
    }
    @IBAction private func didTapOnView(_ sender: UIButton) {
        self.delegate?.didtapOnChangeZipCode()
    }
    
    func getDeliveryString(isDeliveryAvailable:Bool,zipCode:String?) -> NSAttributedString{
        if isDeliveryAvailable{
            let attributedString = NSMutableAttributedString(string: "WE DELIVER TO \(zipCode ?? "Your Zip")", attributes: [
            .font: UIFont.appTitleRegular(ofSize: .medium),
          .foregroundColor: UIColor.appGrey
        ])
            attributedString.addAttribute(.font, value: UIFont.appTitleBold(ofSize: .medium), range: NSRange(location: 14, length: zipCode?.count ?? 0))
            return attributedString as NSAttributedString
        }else{
            let attributedString = NSMutableAttributedString(string: "WE DO NOT DELIVER TO \(zipCode ?? "YOUR ZIP") CHANGE ZIP CODE", attributes: [
                .font: UIFont.appTitleRegular(ofSize: .medium),
              .foregroundColor: UIColor.appGrey
            ])
            attributedString.addAttribute(.font, value: UIFont.appTitleBold(ofSize: .medium), range: NSRange(location: "WE DO NOT DELIVER TO \(zipCode ?? "YOUR ZIP") CHANGE ZIP CODE".count - 15, length: 15))
                return attributedString as NSAttributedString
        }
        
    }
}
