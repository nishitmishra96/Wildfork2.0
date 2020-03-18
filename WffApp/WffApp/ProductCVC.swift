//
//  ProductCVC.swift
//  WFFApp
//
//  Created by Vikas on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class ProductCVC: UICollectionViewCell {

    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var defaultQuantity: UILabel!
    @IBOutlet weak var increaseQuantity: UILabel!
    @IBOutlet weak var Quantity: UILabel!
    @IBOutlet weak var decreaseQuantity: UILabel!
    @IBOutlet weak var productCostPerUnit: UILabel!
    @IBOutlet weak var productWeight: UILabel!
    @IBOutlet weak var ratingStar5: UIImageView!
    @IBOutlet weak var ratingStar4: UIImageView!
    @IBOutlet weak var ratingStar3: UIImageView!
    @IBOutlet weak var ratingSrar2: UIImageView!
    @IBOutlet weak var ratingStar1: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productThumbnail: UIImageView!
    @IBOutlet weak var productName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addToBasketPressed(_ sender: Any) {
    }
}
