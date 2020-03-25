//
//  SearchedProduct.swift
//  WFFApp
//
//  Created by Nishit Mishra on 24/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class SearchedProduct: UITableViewCell {

    @IBOutlet weak var productName: WFFTitleLabel!
    @IBOutlet weak var numberOfPieces: WFFMediumSubtitleLabel!
    @IBOutlet weak var quantity: WFFSmallSubtitleLabel!
    @IBOutlet weak var ratePerLB: WFFSmallSubtitleLabel!
    @IBOutlet weak var cost: WFFTitleLabel!
    @IBOutlet weak var rating: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
