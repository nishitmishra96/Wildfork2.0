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
    var horizontalLayout : UICollectionViewFlowLayout{
        let layout                     = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 40.0
        layout.minimumLineSpacing      = 10.0
        layout.sectionInset            = .zero
        layout.scrollDirection         = .horizontal
        return layout
    }
    var verticallayout : UICollectionViewFlowLayout{
        let layout                     = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 40.0
        layout.minimumLineSpacing      = 10.0
        layout.sectionInset            = .zero
        layout.scrollDirection         = .vertical
        return layout
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "CollectionCVC", bundle: nil), forCellWithReuseIdentifier: "CollectionCVC")
    }

    @IBAction func moreButtonPressed(_ sender: Any) {

        var layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        if layout?.scrollDirection != .vertical{
        collectionView.setCollectionViewLayout(verticallayout, animated: true)
            print("vertical")

            self.collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height * 0.4
        }else{
            self.collectionViewHeight.constant = 150
                collectionView.setCollectionViewLayout(horizontalLayout, animated: true)
            print("horizontal")
        }
        layoutDelegate?.changeLayout(indexpath: indexPath!)
    }
    func setProductCategories(productcategory:[ProductCategories]){
        self.categories = productcategory
        self.collectionView.reloadData()
    }
    
}
extension HomeCollectionTVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCVC", for: indexPath) as! CollectionCVC
        cell.categoryName.text = self.categories[0].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelectCategory(category: self.categories[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 40.0
    }

}
