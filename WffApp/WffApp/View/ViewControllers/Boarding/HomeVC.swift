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
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var tableView: TableView!
    private var homeScreenDS:HomeScreenDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        floatingButton.layer.cornerRadius = floatingButton.frame.height/2
        homeScreenDS = HomeScreenDataSource(delegate: self, tableView: tableView)
        tableView.registerCellNib(HomeCollectionTVC.self)
        tableView.registerCellNib(HomeFeaturedTVC.self)
        tableView.registerCellNib(HomePopularTVC.self)
//        tableView.registerTableViewHeaderFooterNib(HomeTableViewHeader.self)
        tableView.dataSource = homeScreenDS
        self.homeScreenDS?.setupDataSource()
        self.tableView.tableHeaderView = HomeTableViewHeader(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
    }
    
    @IBAction func membershipButtonPressed(_ sender: Any) {
        let membershipVC = Storyboard.home.instanceOf(viewController: MembershipVC.self)!
        membershipVC.modalPresentationStyle = .fullScreen
        membershipVC.modalTransitionStyle = .crossDissolve
        membershipVC.setTextForQRCode(text:"google.com")
        self.present(membershipVC,animated:true,completion:nil)
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
