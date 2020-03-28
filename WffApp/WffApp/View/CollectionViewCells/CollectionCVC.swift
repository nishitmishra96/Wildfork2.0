//
//  CollectionCVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform

class CollectionCVC: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!

    @IBOutlet weak var categoryImageContainer: RoundedView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImageContainer.layer.shadowOpacity = 0.2
        categoryImageContainer.layer.shadowOffset = CGSize(width: 0, height: 5)
        categoryImageContainer.backgroundColor = .white
    }
    override func prepareForReuse() {
        categoryImageContainer.layer.shadowOpacity = 0.2
        categoryImageContainer.layer.shadowOffset = CGSize(width: 0, height: 5)
        categoryImageContainer.backgroundColor = .white
        self.makeCircular()
    }

    func setValues(productCategroy:ProductCategories?){
        guard let category = productCategroy else{return}
        self.categoryImage.image = UIImage(named: "more2")
        self.categoryName.text = category.name
        categoryImageContainer.backgroundColor = .white
    }
}
extension UIView {
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.clipsToBounds = true
    }
}



public class RoundedView: UIView {
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width
    }
}
