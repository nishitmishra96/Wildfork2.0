//
//  FeaturedCVC.swift
//  WFFApp
//
//  Created by Vikas on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class FeaturedCVC: UICollectionViewCell {

    @IBOutlet weak var foregroundLabel: UILabel!
    @IBOutlet weak var foregroundImage: UIImageView!

    @IBOutlet var backgroundImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        foregroundLabel.textColor = UIColor.white
    }

}
