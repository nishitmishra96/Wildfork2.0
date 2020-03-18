//
//  ProductCVC.swift
//  WFFApp
//
//  Created by Vikas on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class ProductCVC: UICollectionViewCell {

    @IBOutlet var changeZipButton: UIButton!
    @IBOutlet var addToBasketButton: UIButton!
    @IBOutlet var updateQuantitySection: UIStackView!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var defaultQuantity: UILabel!
    @IBOutlet weak var increaseQuantity: UIButton!
    @IBOutlet weak var Quantity: UILabel!
    @IBOutlet weak var decreaseQuantity: UIButton!
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
        showQuantitySection()
    }

    @IBAction func addToBasketPressed(_ sender: Any) {
    }
    @IBAction func decreaseQuantityPressed(_ sender: Any) {
        let currentQuantity = Int(Quantity.text!)
        if let qty = currentQuantity{
            if qty > 1{
                let newQuantity = qty - 1
                Quantity.text = String(newQuantity)
            }
        }
        
    }
    @IBAction func increaseQuantityPressed(_ sender: Any) {
        let currentQuantity = Int(Quantity.text!)
        if let qty = currentQuantity{
            let newQuantity = qty + 1
            Quantity.text = String(newQuantity)
        }
    }
    func showAddToBasket(){
        addToBasketButton.isHidden = false
        updateQuantitySection.isHidden = true
        changeZipButton.isHidden = true
    }
    func showQuantitySection(){
        addToBasketButton.isHidden = true
        updateQuantitySection.isHidden = false
        changeZipButton.isHidden = true
    }
    func showChangeZip(){
        addToBasketButton.isHidden = true
        updateQuantitySection.isHidden = true
        changeZipButton.isHidden = false
        
    }
}
