//
//  LocationWebViewVC.swift
//  WildFork
//
//  Created by Himanshu Singh on 03/10/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit
import WebKit
//import SVProgressHUD

protocol LocationDelegate {
    func openViewToShowMapWith(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures)
    func openViewToShowSocialWebsite(url:String)
    
}

class LocationWebViewVC: UIViewController {

    @IBOutlet weak var tabbar: UIToolbar!
    @IBOutlet weak var webView: UIWebView!
    public var navigationAction: WKNavigationAction?
    public var urlStringToLoad: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        if let _ = navigationAction{
            webView.loadRequest(URLRequest(url: (navigationAction?.request.url)!))
        }else{
            webView.loadRequest(URLRequest(url: URL(string: urlStringToLoad!)!))
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabbar.isHidden = true
    }
}


