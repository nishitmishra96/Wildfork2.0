//
//  HomeScreenDataSource.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
import WffPlatform
import CZTableView
enum SectionsOnHomeScreen:Int{
    case category = 0
    case nonCategory = 1
}
//mark for review
var selectedCategory:ProductCategories? = nil
class HomeScreenDataSource:NSObject, UITableViewDataSource,PaginateDelegate,SelectionDelegates{
    
    private var delegate:SelectionDelegates!
    private var tableView:TableView?
    var productcategories:[ProductCategories] = []
    var homeProducts:[HomeScreenCollections] = []
    init(delegate:SelectionDelegates,tableView:TableView) {
        self.delegate = delegate
        self.tableView = tableView
    }
    func setupDataSource(){
        self.tableView?.pagingDelegate = self
        self.tableView?.showLoadingPlaceholder()
        ShopManager.shared.fetchAllCategories { (categories) in
            DispatchQueue.main.async {
                guard let allCategories = categories else { return }
                self.productcategories = allCategories
                
                if let homeItems = (UIApplication.shared.delegate as! AppDelegate).remoteConfig?.configValue(forKey: "homepage").stringValue{
                    if let jsonData = homeItems.data(using: .utf8) {
                        do{
                            let homeScreenItems = try JSONDecoder().decode([HomeScreenCollections].self, from: jsonData)
                            self.homeProducts = homeScreenItems
                        }catch{
                            print("Soemthing not good while getting data")
                        }
                    }
                }
                self.tableView?.reloadData()
            }
        }
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch SectionsOnHomeScreen(rawValue: section) {
        case .category:
            return 1
        case .nonCategory:
            return self.getNonCategoryCellCount()
        default:
            assertionFailure("Woa!!! this cannot be more than 2 man")
            return 0
        }
    }
    
    
    func getCategoryTableViewCell(tableView:UITableView,indexPath:IndexPath)->UITableViewCell{
        let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeCollectionTVC", for: indexPath) as! HomeCollectionTVC
        cell.delegate = self
        cell.layoutDelegate = self
        cell.indexPath = indexPath
        cell.setProductCategories(productcategory: self.productcategories)
        return cell
    }
    func getFeaturedTableViewCell(tableView:UITableView,indexPath:IndexPath)->UITableViewCell{
        let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeFeaturedTVC", for: indexPath) as! HomeFeaturedTVC
        cell.delegate = self
        return cell
    }
    func getPopularTableViewCell(tableView:UITableView,indexPath:IndexPath)->UITableViewCell{
        let cell =  tableView.dequeueReusableCell(withIdentifier: "HomePopularTVC", for: indexPath) as! HomePopularTVC
        cell.delegate = self
        return cell
    }
    func getNonCategoryCellCount()->Int{
        return self.homeProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell = UITableViewCell()
        switch SectionsOnHomeScreen(rawValue: indexPath.section) {
        case .category:
            cell = self.getCategoryTableViewCell(tableView: tableView, indexPath: indexPath)
            
        case .nonCategory:
            if indexPath.row == 0{
                cell = self.getFeaturedTableViewCell(tableView: tableView, indexPath: indexPath)
            }
            else if indexPath.row == 1 {
                cell = self.getPopularTableViewCell(tableView: tableView, indexPath: indexPath)
            }
            
            //cell = UITableViewCell()
            //cell.detailTextLabel?.text = self.homeProducts[indexPath.row].name
        default:
            assertionFailure("Woa!! this cannot come in this")
        }
        
        return cell
    }
    
    func didCallRefreshTableView(for tableView: TableView) {
        tableView.refreshControl?.endRefreshing()
    }
    
    func paginate(to page: Int, for tableView: TableView) {
        
    }
    func didSelectShopAll() {
        self.delegate.didSelectShopAll()
    }
    
    func didSelectCategory(category: ProductCategories) {
        self.delegate.didSelectCategory(category: category)
    }
    
    func didSelectCollection(collection: WFFCollection) {
        self.delegate.didSelectCollection(collection: collection)
    }
    
    func didSelectProduct(product: WFFProduct) {
        self.delegate.didSelectProduct(product: product)
    }
    
}

extension HomeScreenDataSource:LayoutDelegates{
    func changeLayout(indexpath:IndexPath){
        tableView?.beginUpdates()
        tableView?.cellForRow(at: indexpath)?.layoutIfNeeded()
        tableView?.endUpdates()
    }
}
//class CategoryDataSource:HomeScreenDataSource
//{
//    override func getNonCategoryCellCount() -> Int {
//       return  selectedCategory?.subcategories?.count ?? 0
//    }
//}
