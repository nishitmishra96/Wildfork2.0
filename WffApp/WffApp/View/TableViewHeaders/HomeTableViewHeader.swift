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
    }
    private func bindWithViewModel(){
        
        UserManager.shared.userZipCode.asObservable()
            .subscribe(onNext: { (newZip) in
                guard let zipCode = newZip else { return }
                self.truckIcon.isHidden = UserManager.shared.isDeleveryAvailable.value
                self.messageLabel.attributedText = self.getDeliveryString(isDeliveryAvailable: UserManager.shared.isDeleveryAvailable.value, zipCode: zipCode)
            })
            .disposed(by: disposebag)
        UserManager.shared.isDeleveryAvailable.asObservable()
            .subscribe(onNext: { (newValue) in
                self.truckIcon.isHidden = UserManager.shared.isDeleveryAvailable.value
                self.messageLabel.attributedText = self.getDeliveryString(isDeliveryAvailable: UserManager.shared.isDeleveryAvailable.value, zipCode: UserManager.shared.userZipCode.value ?? "YOUR ZIP")
            })
            .disposed(by: disposebag)
    }
    @IBAction private func didTapOnView(_ sender: UIButton) {
        self.delegate?.didtapOnChangeZipCode()
    }
    
    func getDeliveryString(isDeliveryAvailable:Bool,zipCode:String) -> NSAttributedString{
        if isDeliveryAvailable{
            let attributedString = NSMutableAttributedString(string: "WE DELIVER TO \(zipCode)", attributes: [
            .font: UIFont.appTitleRegular(ofSize: .medium),
          .foregroundColor: UIColor.appGrey
        ])
        attributedString.addAttribute(.font, value: UIFont.appTitleBold(ofSize: .medium), range: NSRange(location: 14, length: zipCode.count))
            return attributedString as NSAttributedString
        }else{
            let attributedString = NSMutableAttributedString(string: "WE DO NOT DELIVER TO \(zipCode)", attributes: [
                .font: UIFont.appTitleRegular(ofSize: .medium),
              .foregroundColor: UIColor.appGrey
            ])
            attributedString.addAttribute(.font, value: UIFont.appTitleBold(ofSize: .medium), range: NSRange(location: 21, length: zipCode.count))
                return attributedString as NSAttributedString
        }
        
    }
}
