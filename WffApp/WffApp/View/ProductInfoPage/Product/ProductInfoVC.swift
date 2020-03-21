//
//  ProductInfoVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 17/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import CZTableView
class ProductInfoVC: UIViewController {
    @IBOutlet weak var tableView : TableView!
    private var dataSource = ProductInfoDataSource(withProductId: "78")
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCellNib(ProductImagesTVC.self)
        tableView.registerCellNib(ReviewTableViewCell.self)
//        tableView.registerCellNib(ReviewTableViewCell.self)
//        let nib = UINib.init(nibName: "ReviewHeaderView", bundle: .main)
//        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "ReviewHeaderView")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = dataSource
//        tableView.delegate = self
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
//        tableView.pagingDelegate = self
        tableView.reloadData()
    }
//    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 2{
//            return (Bundle.main.loadNibNamed("ReviewHeaderView", owner: self, options: nil)?[0] as? UIView)
//        }
//        else{
//            return UIView(frame: .zero)
//        }
//    }
}
extension ProductInfoVC:PaginateDelegate{
    func didCallRefreshTableView(for tableView: TableView) {
        self.dataSource.reload()
        self.tableView.refreshControl?.endRefreshing()
    }

    func paginate(to page: Int, for tableView: TableView) {

    }
}
