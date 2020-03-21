//
//  Protocols.swift
//  WFFApp
//
//  Created by Nishit Mishra on 20/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
protocol CellDelegates{
    func UpdateLayout(indexPath:IndexPath,tableView:UITableView)
    func beginUpdates(tableView: UITableView)
    func endUpdates(tableView: UITableView)
}
