//
//  CollectionCVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class CollectionCVC: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!

    @IBOutlet weak var categoryImageContainer: RoundedView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImageContainer.layer.shadowOpacity = 0.2
        categoryImageContainer.layer.shadowOffset = CGSize(width: 0, height: 5)
       
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
