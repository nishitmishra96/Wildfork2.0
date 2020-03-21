//
//  ProductImagesTVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class ProductImagesTVC: UITableViewCell {
    private var imagesUrls:[String] = []
    @IBOutlet private weak var favIcon: UIImageView!
    @IBOutlet private weak var pageIndicator:UIPageControl!
  @IBOutlet private weak var collectionView: UICollectionView!
    
       override func awakeFromNib() {
           super.awakeFromNib()

           collectionView.delegate = self
           collectionView.dataSource = self
           collectionView.register(UINib.init(nibName: "ImageCVC", bundle: nil), forCellWithReuseIdentifier: "ImageCVC")
           
       }
    func setIsProductFav(fav:Bool){
        self.favIcon.isHidden = !fav
    }
    func setImages(_ urls:[String]){
        self.imagesUrls = urls
        self.collectionView.reloadData()
        self.pageIndicator.numberOfPages = urls.count
        self.pageIndicator.currentPage = 0
    }
    
}
extension ProductImagesTVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCVC", for: indexPath) as! ImageCVC
        cell.setImage(url: self.imagesUrls[indexPath.row])
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("write pagginf logic")
    }
}
