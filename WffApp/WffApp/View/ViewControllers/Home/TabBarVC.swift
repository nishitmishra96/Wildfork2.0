//
//  TabBarVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController,UITabBarControllerDelegate {
    
    let home =   UINavigationController.init(rootViewController: Storyboard.home.instanceOf(viewController: HomeVC.self)!)
    let membershipVC = Storyboard.home.instanceOf(viewController: MembershipVC.self)!
    let accountVC = Storyboard.start.instanceOf(viewController: Login.self)!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.setupStyleOfTabbar()
        self.viewControllers = [home,membershipVC,accountVC]
        self.delegate = self
        UserDefaults.isIntroShown = true
    }
    private func setupStyleOfTabbar(){
        self.showButtonOnSearchBar(target: nil, action: nil)
        home.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(imageLiteralResourceName: "shop") , selectedImage: UIImage(imageLiteralResourceName: "shop"))
        home.tabBarItem.image = UIImage(imageLiteralResourceName: "shop").withRenderingMode(.alwaysOriginal)
        home.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "shop").withRenderingMode(.alwaysTemplate).setImageColor(color: .white)
        home.tabBarItem.image = home.tabBarItem.image?.setImageColor(color: .gray)
        
        membershipVC.tabBarItem = UITabBarItem(title: "Membership", image: UIImage(imageLiteralResourceName: "fav") , selectedImage: UIImage(imageLiteralResourceName: "fav"))
        membershipVC.tabBarItem.image = UIImage(imageLiteralResourceName: "fav").withRenderingMode(.alwaysOriginal)
        membershipVC.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "fav").withRenderingMode(.alwaysTemplate).setImageColor(color: .white)
        membershipVC.tabBarItem.image = membershipVC.tabBarItem.image?.setImageColor(color: .gray)
        
        accountVC.tabBarItem = UITabBarItem(title: "Account", image: UIImage(imageLiteralResourceName: "account") , selectedImage: UIImage(imageLiteralResourceName: "account"))
        accountVC.tabBarItem.image = UIImage(imageLiteralResourceName: "account").withRenderingMode(.alwaysOriginal)
        accountVC.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "account").withRenderingMode(.alwaysTemplate).setImageColor(color: .white)
        accountVC.tabBarItem.image = accountVC.tabBarItem.image?.setImageColor(color: .gray)
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is MembershipVC{
            (viewController as? MembershipVC)?.closeButton.isHidden = true
        }
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
