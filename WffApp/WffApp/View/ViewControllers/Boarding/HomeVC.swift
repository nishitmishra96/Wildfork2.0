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
protocol LayoutDelegates {
    func changeLayout(indexpath:IndexPath)
}
class HomeVC: UIViewController {
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var tableView: TableView!
    private var homeScreenDS:HomeScreenDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.isNavigationBarHidden = false
        floatingButton.layer.cornerRadius = floatingButton.frame.height/2
        homeScreenDS = HomeScreenDataSource(delegate: self, tableView: tableView)
        tableView.registerCellNib(HomeCollectionTVC.self)
        tableView.registerCellNib(HomeFeaturedTVC.self)
        tableView.registerCellNib(HomePopularTVC.self)
//        tableView.registerTableViewHeaderFooterNib(HomeTableViewHeader.self)
        tableView.dataSource = homeScreenDS
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        self.homeScreenDS?.setupDataSource()
        var headerView = HomeTableViewHeader(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
        headerView.delegate = self
        self.tableView.tableHeaderView = headerView
        UserDefaults.standard.set(true, forKey: AppKeys.userSawHome.rawValue)
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

extension HomeVC:DeleveryViewDelegate{
    func didtapOnChangeZipCode(){
        self.present(Storyboard.start.instanceOf(viewController: PopupVC.self)!, animated: true, completion: nil)
    }
}
