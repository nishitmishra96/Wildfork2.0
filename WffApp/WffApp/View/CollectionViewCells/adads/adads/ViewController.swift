//
//  ViewController.swift
//  adads
//
//  Created by Nishit Mishra on 18/03/20.
//  Copyright © 2020 Nishit Mishra. All rights reserved.
//

import UIKit
import SWSegmentedControl

class ViewController: UIViewController,SWSegmentedControlDelegate {

    @IBOutlet var outsideview: UIView!
    @IBOutlet var star: SetStar!
    
//    @IBOutlet weak var segmentedControl: SWSegmentedControl!
    
    @IBOutlet var viiew: RatingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viiew.setWidthWith(percentage: 0.33)
        star.set(rating: 4,numberOfReviews: 4)
    }
    
    @IBAction func b1(_ sender: Any) {
        star.set(rating: 4, numberOfReviews: 3)
    }
    @IBAction func b2(_ sender: Any) {
        star.setRatingWithoutNumberOfReviews(rating: 2)
    }

}



@IBDesignable class RatingView:UIView{
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setWidthWith(percentage:CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: superview!.frame.size.width*percentage).isActive = true
        layoutIfNeeded()
    }
}

@IBDesignable class SetStar:UIView{
    var stackView = UIStackView()
    var label = UILabel()
    var arrayOfStars : [UIImageView] = [UIImageView(image: UIImage(systemName: "star")),UIImageView(image: UIImage(systemName: "star")),UIImageView(image: UIImage(systemName: "star")),UIImageView(image: UIImage(systemName: "star")),UIImageView(image: UIImage(systemName: "star"))]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.distribution = .fillEqually
        setInitials()
    }

    private func setInitials(){
        for imageView in arrayOfStars{
            stackView.addArrangedSubview(imageView)
        }
        stackView.addArrangedSubview(label)
    }
    public func set(rating:Int,numberOfReviews:Int){
        for count in 0..<arrayOfStars.count{
            if count < rating{
            arrayOfStars[count].image = UIImage(systemName: "star.fill")
            }else{
                arrayOfStars[count].image = UIImage(systemName: "star")
            }
        }
        label.isHidden = false
        label.text = " (\(numberOfReviews))"
    }
    public func setRatingWithoutNumberOfReviews(rating:Int){
        for count in 0..<arrayOfStars.count{
            if count < rating{
            arrayOfStars[count].image = UIImage(systemName: "star.fill")
            }else{
                arrayOfStars[count].image = UIImage(systemName: "star")
            }
        }
        
        label.isHidden = true
    }
}


@IBDesignable class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            translatesAutoresizingMaskIntoConstraints = false
            widthAnchor.constraint(equalToConstant: (imageView?.frame.width ?? 0) + (titleLabel?.frame.width ?? 0) + 20).isActive = true
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageView?.image?.size.width ?? 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left:imageView?.frame.width ?? 0, bottom: 0, right: (bounds.width))
            layoutIfNeeded()
        }
    }
    
}
