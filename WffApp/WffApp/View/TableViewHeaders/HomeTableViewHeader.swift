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
                guard let zipcode = newZip else { return }
                let newValue = UserManager.shared.isDeleveryAvailable.value
                if newValue{
                    self.truckIcon.isHidden = false
                    self.messageLabel.text = "We Deliver to \(zipcode)"
                }else{
                    self.truckIcon.isHidden = false
                    self.messageLabel.text = "WE DO NOT DELIVER TO \(zipcode)"
                }
            })
            .disposed(by: disposebag)
        UserManager.shared.isDeleveryAvailable.asObservable()
            .subscribe(onNext: { (newValue) in
                if newValue{
                    self.truckIcon.isHidden = false
                    self.messageLabel.text = "We Deliver to \(UserManager.shared.userZipCode.value ?? "Your Zip")"
                }else{
                    self.truckIcon.isHidden = false
                    self.messageLabel.text = "WE DO NOT DELIVER TO \(UserManager.shared.userZipCode.value ?? "Your Zip")"
                }
            })
            .disposed(by: disposebag)
    }
    @IBAction private func didTapOnView(_ sender: UIButton) {
        self.delegate?.didtapOnChangeZipCode()
    }
}
