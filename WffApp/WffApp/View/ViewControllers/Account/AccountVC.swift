//
//  AccountVC.swift
//  WFFApp
//
//  Created by Nishit Mishra on 24/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit

class AccountVC: UIViewController,UIScrollViewDelegate {
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    let loginVC = Storyboard.start.instanceOf(viewController: Login.self)!
    let registerVC = Storyboard.start.instanceOf(viewController: RegisterVC.self)!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpViewControllers()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        print(scrollView.contentOffset.y)
    }
    private func setUpViewControllers(){
        self.addChild(loginVC)
        self.addChild(registerVC)
        self.stackView.addArrangedSubview(loginVC.view)
        self.stackView.addArrangedSubview(registerVC.view)
        self.scrollView.isPagingEnabled = true
        self.scrollView.isScrollEnabled = false
        }
    
    private func scrollToViewController(index:Int){
        self.scrollView.contentOffset.x = self.view.frame.width * CGFloat(index)
    }
    

}
