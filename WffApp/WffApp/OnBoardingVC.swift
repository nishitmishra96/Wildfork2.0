//
//  PageViewVC.swift
//  WildFork
//
//  Created by Himanshu Singh on 30/09/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import UIKit
//import CocoaLumberjack

class OnBoardingDataSource{
    static var shared = OnBoardingDataSource()
    var images = [UIImage(named: "onboardingIllustrations1")!,UIImage(named: "onboardingIllustrations2")!,UIImage(named: "onboardingIllustrations3")!,UIImage(named: "onboardingIllustrations4")!]
    var upperText = ["SHOP FASTER THAN EVER","SCAN LABELS FOR RECIPE IDEAS","ALWAYS BE IN KNOW","GET HELP WHEN YOU NEED IT"]
    var lowerText = ["Welcome to Wild Fork Foods! We’re now making it easier than ever to shop. Enjoy a personalized experience and reorder your favorites fast.","Scan QR codes in store to get the latest recipe inspiration direct from our personal chef.","Need help navigating our 500+ cuts? Chat with our friendly butchers to get personalized recommendations for everyday and special occasions.","You like quality, and so do we. Our freezing process seals in the nutrients at the peak of freshness to deliver the best to your fork at a low price."]
    
    func getImages(index:Int)-> UIImage{
       return images[index]
    }
    
    func getUpperText(index:Int)-> String{
        return upperText[index]
    }
    func getLowerText(index:Int)-> String{
        return lowerText[index]
    }
}

class OnBoardingVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var colView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var loginButton: UIButton!
    public var launchOptions: [UIApplication.LaunchOptionsKey: Any]?

    @IBAction func LoginButtonPressed(_ sender: Any) {
//        let debug_info = String(format: "Login pressed on boarding screen")
//        DDLogInfo(debug_info)
//        let homeVC = Storyboard.home.instanceOf(viewController: HomeVC.self)
//        homeVC?.loginOrRegisterPressed = true
//        homeVC?.launchOptions = self.launchOptions
//        let Nav = UINavigationController.init(rootViewController: homeVC!)
//        Nav.navigationBar.isTranslucent = false
//        Nav.isNavigationBarHidden = true
//        AppDelegate.shared().window?.rootViewController = Nav
//        AppDelegate.shared().window?.makeKeyAndVisible()
    }
    
    @IBAction func StartShoppingButtonPressed(_ sender: Any) {
//        let debug_info = String(format: "Start shopping pressed on boarding screen")
//        DDLogInfo(debug_info)
//        let homeVC = Storyboard.home.instanceOf(viewController: HomeVC.self)
//        let Nav = UINavigationController.init(rootViewController: homeVC!)
//        Nav.navigationBar.isTranslucent = false
//        Nav.isNavigationBarHidden = true
//        homeVC?.launchOptions = self.launchOptions
//
//        AppDelegate.shared().window?.rootViewController = Nav
//        AppDelegate.shared().window?.makeKeyAndVisible()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colView.showsHorizontalScrollIndicator = false
        colView.showsVerticalScrollIndicator = false
        colView.register(BoardingCollectionViewCell.self, forCellWithReuseIdentifier: "BoardingCollectionViewCell")
        colView.delegate = self
        colView.dataSource = self
        colView.register(UINib.init(nibName: "BoardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BoardingCollectionViewCell")
        configurePageControl()
        loginButton.layer.borderWidth = 1
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = 4
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.white
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
    }
}

extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardingCollectionViewCell", for: indexPath) as! BoardingCollectionViewCell
        cell.upperImage.image = OnBoardingDataSource.shared.getImages(index: indexPath.row)
        cell.upperText.text = OnBoardingDataSource.shared.getUpperText(index: indexPath.row)
        cell.lowerText.text = OnBoardingDataSource.shared.getLowerText(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
