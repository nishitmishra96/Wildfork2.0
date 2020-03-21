//
//  review.swift
//  WFFApp
//
//  Created by Nishit Mishra on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform
import SDWebImage
class ReviewTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var verificationStatus: UILabel!
    @IBOutlet var reviewTitle: UILabel!
    @IBOutlet var review: ExpandableLabel!
    @IBOutlet var starRating: SetStar!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var shareButton: UIButton!
    var indexPath : IndexPath?
    var reviewFromYotpo : Review?
    var tableView : UITableView?
    var delegate : CellDelegates?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setInitials()
        review.numberOfLines = 3
        review.collapsedAttributedLink = NSAttributedString(string: "Read More")
        review.collapsed = true
        review.delegate = self
        print("awake from nib")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        review.text = ""
        review.numberOfLines = 3
        review.collapsed = true
        review.delegate = self
        print("Prepare for reuse")
    }

    func setInitials(){
        profileImage.layer.cornerRadius = profileImage.frame.width/2
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func setData(withReview:Review?){
        
        print("set data TEsting")
        review.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        guard let _ = withReview else{return}
        self.reviewFromYotpo = withReview
        self.userName.text = reviewFromYotpo?.user?.displayName
        self.review.text = reviewFromYotpo?.content
        self.reviewTitle.text = reviewFromYotpo?.title
        self.starRating.setRatingWithoutNumberOfReviews(rating: reviewFromYotpo?.score ?? 0)
//        self.profileImage.sd_setImage(with: URL(string: reviewFromYotpo?.user?.socialImage ?? ""), completed: nil)
        self.verificationStatus.text = (reviewFromYotpo?.verifiedBuyer ?? false) ? "Verified Reviewer" : ""
    }
}

extension ReviewTableViewCell:ExpandableLabelDelegate{
    func willExpandLabel(_ label: ExpandableLabel) {
        delegate?.beginUpdates(tableView: self.tableView!)
        label.lineBreakMode = .byTruncatingTail
        delegate?.UpdateLayout(indexPath: indexPath!, tableView: tableView!)
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
        delegate?.endUpdates(tableView: self.tableView!)
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        
    }
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        
    }
    
    func didTapOnLink(_ label: ExpandableLabel, link: String) {
        
    }
}

