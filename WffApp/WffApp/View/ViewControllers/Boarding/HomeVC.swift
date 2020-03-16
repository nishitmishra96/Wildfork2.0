//
//  HomeVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import CZTableView
import WffPlatform
protocol SelectionDelegates {
    func didSelectShopAll()
    func didSelectCategory(category:ProductCategories)
    func didSelectCollection(collection:WFFCollection)
    func didSelectProduct(product:WFFProduct)
}
class HomeVC: UIViewController {
    @IBOutlet weak var tableView: TableView!
    private var homeScreenDS:HomeScreenDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        homeScreenDS = HomeScreenDataSource(delegate: self, tableView: tableView)
        tableView.registerCellNib(HomeCollectionTVC.self)
        tableView.dataSource = homeScreenDS
        self.homeScreenDS?.setupDataSource()
    }
}

extension HomeVC:SelectionDelegates{
    
    func didSelectCategory(category: ProductCategories) {
        self.pushViewController(CategorySelectionVC.getVC(forCategory: category))
    }
    
    func didSelectShopAll() {
        
    }
    
    func didSelectCollection(collection: WFFCollection) {
        
    }
    
    func didSelectProduct(product: WFFProduct) {
        
    }
    
    
}
