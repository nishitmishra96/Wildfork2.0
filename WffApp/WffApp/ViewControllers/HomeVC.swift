//
//  HomeVC.swift
//  WildFork
//
//  Created by Himanshu Singh on 25/09/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit
import StoreKit
class HomeVC: UITabBarController {
    var loginOrRegisterPressed: Bool = false
    var launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    var isNewRegister = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        //To increment AppOpenedCount
        StoreReviewHelper.incrementAppOpenedCount()
        if let remoteNotification = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] as? NSDictionary
        {
            let notification = /(remoteNotification["notificationTitle"] as? String)
            SendCustomEventsToGoogleAnalytics.sendEventToGoogle(category: GoogleEventKeys.Category.key, action: /notification)
            guard let url = remoteNotification["url"] as? String else{return}
            let vc = Storyboard.home.instanceOf(viewController: WebviewOpener.self)!
            vc.urlStringToLoad = url
            UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        }
        
    }
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.value(forKey: AppKeys.userSawHome.key) == nil{
            UserDefaults.standard.setValue("True", forKey: AppKeys.userSawHome.key)
        }else{
            print("User Already Saw Home Before")
        }
        if loginOrRegisterPressed{
            self.selectedIndex = 3
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension HomeVC: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is QRScannerVC {
            SendCustomEventsToGoogleAnalytics.sendEventToGoogle(category: GoogleEventKeys.Category.key,action: GoogleEventKeys.User_Pressed_QR_Tab.key)
            if let _ = tabBarController.storyboard?.instantiateViewController(withIdentifier: "QRScannerVC") {
                let qrScannerVC = Storyboard.home.instanceOf(viewController: QRScannerVC.self)
                qrScannerVC?.receipeDelegate = self
                qrScannerVC?.modalPresentationStyle = .fullScreen
                tabBarController.present(qrScannerVC!, animated: true)
            }
            return false
        }
        return true
    }
}

extension HomeVC:ReceipeDelegate{
    func qrCodeScanned(qrString:String){
        self.presentedViewController?.dismiss(animated: true, completion: {
            let recipeWebView = Storyboard.home.instanceOf(viewController: WebviewOpener.self)
            recipeWebView?.urlStringToLoad = qrString
            recipeWebView?.modalPresentationStyle = .fullScreen
            self.present(recipeWebView!, animated: true, completion: nil)
        })
    }
}

