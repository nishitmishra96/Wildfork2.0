//
//  TabBarVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    let home = Storyboard.home.instanceOf(viewController: HomeVC.self)!

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.setTittleImage()
        self.setupStyleOfTabbar()
        self.viewControllers = [home]
    }
    private func setupStyleOfTabbar(){
        self.showButtonOnSearchBar(target: nil, action: nil)
        home.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(imageLiteralResourceName: "shop") , selectedImage: UIImage(imageLiteralResourceName: "shop"))
        home.tabBarItem.image = UIImage(imageLiteralResourceName: "shop").withRenderingMode(.alwaysOriginal)
        home.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "shop").withRenderingMode(.alwaysTemplate).setImageColor(color: .white)
        home.tabBarItem.image = home.tabBarItem.image?.setImageColor(color: .gray)
        
    }


}
extension UISearchController {
    func cancelButton() -> UIButton? {
        if #available(iOS 13.0, *) {
            return findCancelButton13()
        }
        return findCancelButtonOld()
    }

    func findCancelButtonOld() -> UIButton? {
        for subView in searchBar.subviews {
            for v in subView.subviews {
                if let button = v as? UIButton {
                    return button
                }
            }
        }
        return nil
    }

    @available(iOS 13.0, *)
    func findCancelButton13() -> UIButton? {
        for subView in searchBar.subviews {
            for v in subView.subviews {
                for b in v.subviews {
                    if let button = b as? UIButton {
                        return button
                    }
                }
            }
        }
        return nil
    }
}
