//
//  OnboardingCVC.swift
//  WFFApp
//
//  Created by Vikas on 20/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class OnboardingCVC: UICollectionViewCell {

    @IBOutlet weak var onboardingSubtitle: UILabel!
    @IBOutlet weak var onboardingTitle: UILabel!
    @IBOutlet weak var onboardingImage: UIImageView!
    @IBOutlet weak var width: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        width.constant = UIScreen.main.bounds.width
        onboardingTitle.font = UIFont.appTitleBold(ofSize: .large)
        onboardingSubtitle.font = UIFont.appSubTitleLight(ofSize: .medium)
        // Initialization code
    
    }
    func setOnboardingView(image: UIImage , title:String , subtitle: String){
        onboardingImage.image = image
        onboardingTitle.text = title
        onboardingSubtitle.text = subtitle
    
        
    }
}
