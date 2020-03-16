//
//  CategorySelectionVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import CZTableView
import WffPlatform
class CategorySelectionVC: UIViewController {
    @IBOutlet weak var tableView:TableView!
    private var category:ProductCategories!
    private var categoryDS:CategoryDataSource?
    class func getVC(forCategory:ProductCategories)->CategorySelectionVC{
        let vc = Storyboard.home.instanceOf(viewController: CategorySelectionVC.self)!
        vc.category = forCategory
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCategory = self.category
        tableView.registerCellNib(HomeCollectionTVC.self)
        categoryDS = CategoryDataSource(delegate: self, tableView: tableView)
        tableView.dataSource = categoryDS
        categoryDS?.setupDataSource()
    }
    override func popViewController() {
        selectedCategory = nil
        super.popViewController()
    }
    
}
extension CategorySelectionVC:SelectionDelegates{
    func didSelectShopAll() {
        
    }
    
    func didSelectCategory(category: ProductCategories) {
        
    }
    
    func didSelectCollection(collection: WFFCollection) {
        
    }
    
    func didSelectProduct(product: WFFProduct) {
        
    }
    
    
}
