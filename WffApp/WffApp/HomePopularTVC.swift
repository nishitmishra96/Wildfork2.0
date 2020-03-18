//
//  HomePopularTVC.swift
//  WFFApp
//
//  Created by Vikas on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform

class HomePopularTVC: UITableViewCell {
    var delegate:SelectionDelegates?
@IBOutlet var popularCollectionView: UICollectionView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
        popularCollectionView.register(UINib(nibName: "PopularCVC", bundle: nil), forCellWithReuseIdentifier: "PopularCVC")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension HomePopularTVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height:320)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 24.0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCVC", for: indexPath) as! PopularCVC
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowOffset = CGSize(width: 3, height: 5)
        cell.layer.shadowRadius = 5
        return cell
    }
    
    
}

