//
//  AllReviews.swift
//  WFFApp
//
//  Created by Nishit Mishra on 19/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class AllReviews: UITableViewCell {
    @IBOutlet var reviewTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        var nib = UINib.init(nibName: "ReviewTableViewCell", bundle: .main)
//        reviewTableView.register(nib, forCellReuseIdentifier: "ReviewTableViewCell")
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
    }
    
}

extension AllReviews:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        return UITableViewCell()
    }
}
