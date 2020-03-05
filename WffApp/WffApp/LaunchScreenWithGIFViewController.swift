//
//  LaunchScreenWithGIFViewController.swift
//  WildFork
//
//  Created by Himanshu Singh on 03/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit
import Player

class LaunchScreenWithGIFViewController: UIViewController {

    fileprivate var player = Player()
    
    var launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    // MARK: object lifecycle
    deinit {
        self.player.willMove(toParent: nil)
        self.player.view.removeFromSuperview()
        self.player.removeFromParent()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loginUser()
    }
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        IQKeyboardManager.shared.enable = true
//        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
//        IQKeyboardManager.shared.enableAutoToolbar = false
        self.setPlayerAndPlayVideo()
//        self.setupTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let debug_info = String(format: "Splash Appeared")
//        DDLogInfo(debug_info)
    }
    func setPlayerAndPlayVideo(){
        self.player = Player()
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.player.playerDelegate = self as? PlayerDelegate
        self.player.playbackDelegate = self
        let fileURL = Bundle.main.url(forResource:"splashvideo", withExtension: "mov")?.absoluteURL
        self.player.url = fileURL!
        self.player.view.frame = self.view.bounds
        player.fillMode = .resizeAspectFill
        self.addChild(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParent: self)
    }
    
    func loginUser(){
//        guard let email = KeyChain.shared.email else { return }
//        guard let password = KeyChain.shared.passWord else { return }
//        UserManager.shared.Login(email: email, password: password) { (_) -> (Void) in
            
//        }
    }
}

extension LaunchScreenWithGIFViewController: PlayerPlaybackDelegate{
    func playerCurrentTimeDidChange(_ player: Player) {
    }

    func playerPlaybackWillStartFromBeginning(_ player: Player) {
    }

    func playerPlaybackWillLoop(_ player: Player) {
    }

    func playerPlaybackDidEnd(_ player: Player) {
//        if UserDefaults.standard.value(forKey: AppKeys.userSawHome.key) == nil{
//            self.navigateToOnBoardVC()
//        }else{
//            self.navigateToHomeVC()
//        }
    }
}
//extension LaunchScreenWithGIFViewController{
//    private func navigateToOnBoardVC(){
//        let onBoardingVC = Storyboard.home.instanceOf(viewController: OnBoardingVC.self)!
//        onBoardingVC.launchOptions = self.launchOptions
//        self.navigationController?.pushViewController(onBoardingVC, animated: true)
//    }
//    private func navigateToHomeVC(){
//        let homeVC = Storyboard.home.instanceOf(viewController: HomeVC.self)
//        let Nav = UINavigationController.init(rootViewController: homeVC!)
//        Nav.navigationBar.isTranslucent = false
//        Nav.isNavigationBarHidden = true
//        homeVC?.launchOptions = self.launchOptions
//        AppDelegate.shared().window?.rootViewController = Nav
//        AppDelegate.shared().window?.makeKeyAndVisible()
//    }
//    func setupTabBar(){
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.app_text_gray_Color], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.app_selected_tab_Color], for: .selected)
//    }
//}
