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
        tableView.registerCellNib(ProductsGridTVC.self)
        tableView.registerCellNib(SubCategoryListTVC.self)
        tableView.dataSource = self
        tableView.delegate = self
        let headerNib = UINib.init(nibName: "ProductsHeader", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "ProductsHeader")
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
        1
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           return 2
//       }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let productsHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProductsHeader") as! ProductsHeader
        return productsHeader
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsGridTVC", for: indexPath) as! ProductsGridTVC
            return cell
       }


       }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return UITableView.automaticDimension
       }
       func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
           return 40
       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UIScreen.main.bounds.height - 100
        
}
