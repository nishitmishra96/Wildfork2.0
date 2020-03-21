//
//  ProductInfoDataSource.swift
//  WFFApp
//
//  Created by Himanshu Singh on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import WffPlatform
fileprivate enum ProductPageTableViewSections:Int{
    case images = 0
    case price
    case description
    case recommended
    case reviews
}
class ProductInfoDataSource: NSObject {
    private var model:ResponseProduct?
    init(withProductId:String) {

    }
    func reload(){}
}
extension ProductInfoDataSource:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ProductPageTableViewSections(rawValue: indexPath.section) {
        case .images:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductImagesTVC", for: indexPath) as! ProductImagesTVC
            if let images = self.model?.images?.map({ (obj) -> String in
                return obj.src ?? ""
            }){
            cell.setImages(images)
            }
            return cell
 
        case .reviews:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
             cell.indexPath = indexPath
             cell.delegate = self
             cell.tableView = tableView
             cell.setData(withReview: nil)
             return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ProductInfoDataSource:CellDelegates{
    func beginUpdates(tableView: UITableView) {
        tableView.beginUpdates()
    }
    func endUpdates(tableView: UITableView) {
        tableView.endUpdates()
    }
    func UpdateLayout(indexPath:IndexPath,tableView: UITableView) {
        tableView.cellForRow(at: indexPath)?.layoutIfNeeded()
    }
}
