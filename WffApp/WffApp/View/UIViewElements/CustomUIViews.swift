//
//  RatingBar.swift
//  WFFApp
//
//  Created by Nishit Mishra on 18/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
class RatingBar:UIView{
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setPercentage(percentage:CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: superview!.frame.size.width*percentage).isActive = true
        layoutIfNeeded()
    }
}

class SetStar:UIView{
    private var stackView = UIStackView()
    var label = UILabel()
    // TODO: Add assets when available
    private var arrayOfStars : [UIImageView] = [UIImageView(image: UIImage(named: "star")),UIImageView(image: UIImage(named: "star")),UIImageView(image: UIImage(named: "star")),UIImageView(image: UIImage(named: "star")),UIImageView(image: UIImage(named:"star"))]
    
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
                arrayOfStars[count].image = UIImage(named: "star.fill")
            }else{
                arrayOfStars[count].image = UIImage(named: "star")
            }
        }
        label.isHidden = false
        label.text = " (\(numberOfReviews))"
    }
    public func setRatingWithoutNumberOfReviews(rating:Int){
        for count in 0..<arrayOfStars.count{
            if count < rating{
                arrayOfStars[count].image = UIImage(named: "star.fill")
            }else{
                arrayOfStars[count].image = UIImage(named: "star")
            }
        }
        
        label.isHidden = true
    }
}

@IBDesignable class QRCodeView:UIImageView{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image = UIImage(named:"wfQrCode")
    }
    func setQRCode(text:String){
        let data = text.data(using: .isoLatin1, allowLossyConversion: false)
        var qrcodeImage: CIImage!
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("Q" , forKey: "inputCorrectionLevel")
        qrcodeImage = filter?.outputImage
        let scaleX = frame.size.width / qrcodeImage.extent.size.width
         let scaleY = frame.size.height / qrcodeImage.extent.size.height

        let transformedImage = qrcodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))

        self.image = UIImage(ciImage: transformedImage)
//        self.image = UIImage(ciImage: qrcodeImage)
    }
}
