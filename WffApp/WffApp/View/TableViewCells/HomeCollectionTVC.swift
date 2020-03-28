//
//  HomeCollectionTVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform

class HomeCollectionTVC: UITableViewCell {
    var delegate:SelectionDelegates?
    var layoutDelegate : LayoutDelegates?
    private var categories:[ProductCategories] = []
    var indexPath:IndexPath?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight : NSLayoutConstraint!
    @IBOutlet weak var moreOrLess : UILabel!
    @IBOutlet weak var moreOrLessButton : UIButton!
    var moreTapped = false{
        didSet{
            changeHeightOfCollectionView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionViewHeight.constant = 200
        collectionView.delegate = self
        collectionView.dataSource = self
        moreOrLess.text = "More"; collectionView.register(UINib.init(nibName: "CollectionCVC", bundle: nil), forCellWithReuseIdentifier: "CollectionCVC")
//        moreOrLessButton.alignTextBelow(spacing: 2)
    }

    @IBAction func moreButtonPressed(_ sender: Any) {
        moreTapped = !moreTapped
    }
    func setProductCategories(productcategory:[ProductCategories]){
        self.categories = productcategory
        self.collectionView.reloadData()
    }
    func changeHeightOfCollectionView(){
        if moreTapped{
            self.collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
            self.moreOrLess.text = "Less"
//            self.moreOrLessButton.setImage(UIImage(named: "dropdown"), for: .normal)
            self.moreOrLessButton.titleLabel?.text = "Less"
        }else{
            self.collectionViewHeight.constant = 200
            self.moreOrLess.text = "More"
//            self.moreOrLessButton.titleLabel?.text = "More"
            self.moreOrLessButton.setImage(UIImage(named: "dropdown"), for: .normal)
        }
        layoutDelegate?.changeLayout(indexpath: indexPath!)
        collectionView.layoutIfNeeded()
    }
    
}
extension HomeCollectionTVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  (collectionView.frame.size.width - (5 * UIScreen.main.bounds.size.width / 25))/5, height: collectionView.frame.size.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCVC", for: indexPath) as! CollectionCVC
        cell.setValues(productCategroy: self.categories[0])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelectCategory(category: self.categories[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 0, left:9, bottom: 0, right:9);
    }
}
 public extension UIButton
  {

    func alignTextBelow(spacing: CGFloat = 6.0)
    {
        if let image = self.imageView?.image
        {
            let imageSize: CGSize = image.size
            self.imageEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
            let labelString = NSString(string: self.titleLabel?.text ?? " ")
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font])
            self.titleEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }
}
