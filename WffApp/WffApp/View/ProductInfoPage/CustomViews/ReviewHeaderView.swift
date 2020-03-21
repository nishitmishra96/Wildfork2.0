//
//  ReviewHeaderView.swift
//  WFFApp
//
//  Created by Himanshu Singh on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import SWSegmentedControl
class ReviewHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var containerView:UIView!
    @IBOutlet weak var firstRatingBar:RatingBar!
    @IBOutlet weak var secondRatingBar:RatingBar!
    @IBOutlet weak var thirdRatingBar:RatingBar!
    @IBOutlet weak var fourthRatingBar:RatingBar!
    @IBOutlet weak var fifthRatingBar:RatingBar!
    @IBOutlet weak var fiveStarRating:SetStar!
    @IBOutlet weak var fourStarRating:SetStar!
    @IBOutlet weak var threeStarRating:SetStar!
    @IBOutlet weak var twoStarRating:SetStar!
    @IBOutlet weak var oneStarRating:SetStar!
    @IBOutlet weak var topReviewView: UIView!
    @IBOutlet weak var reviewLabel:UILabel!
    @IBOutlet weak var questionAnswerLabel:UILabel!
    @IBOutlet weak var segmentedControl: SWSegmentedControl!
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("ReviewHeaderView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        let segment = SWSegmentedControl(items: ["Ratings","Question"])
    }
}
