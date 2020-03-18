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
class CategorySelectionVC: UIViewController{
   
   
    
    @IBOutlet weak var tableView:TableView!
    private var category:ProductCategories!
    //private var categoryDS:CategoryDataSource?
    class func getVC(forCategory:ProductCategories)->CategorySelectionVC{
        let vc = Storyboard.home.instanceOf(viewController: CategorySelectionVC.self)!
        vc.category = forCategory
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCategory = self.category
        //categoryDS = CategoryDataSource(delegate: self, tableView: tableView)
        //tableView.dataSource = categoryDS
        //tableView.registerCellNib(ProductsGridCell.self)
        //categoryDS?.setupDataSource()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func popViewController() {
        selectedCategory = nil
        super.popViewController()
    }
    
}
//extension CategorySelectionVC:SelectionDelegates{
//    func didSelectShopAll() {
//
//    }
//
//    func didSelectCategory(category: ProductCategories) {
//
//    }
//
//    func didSelectCollection(collection: WFFCollection) {
//
//    }
//
//    func didSelectProduct(product: WFFProduct) {
//
//    }
//
//
//}
extension CategorySelectionVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsGridCell", for: indexPath) as! ProductsGridCell
            return cell
    
       }
}
