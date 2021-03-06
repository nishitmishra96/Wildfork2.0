//
//  ProductsSubCategoryHeader.swift
//  WFFApp
//
//  Created by Vikas on 18/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
class ProductsHeader : UITableViewHeaderFooterView {
    @IBOutlet var subCategoryCollection: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subCategoryCollection.delegate = self
        subCategoryCollection.dataSource = self
        subCategoryCollection.register(UINib(nibName: "ProductSubCategoryCVC", bundle: nil), forCellWithReuseIdentifier: "ProductSubCategoryCVC")
    }
    
}
extension ProductsHeader:UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height:60)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSubCategoryCVC", for: indexPath) as! ProductSubCategoryCVC
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowOffset = CGSize(width: 3, height: 5)
        cell.layer.shadowRadius = 5
        return cell
    }
    
    
}
