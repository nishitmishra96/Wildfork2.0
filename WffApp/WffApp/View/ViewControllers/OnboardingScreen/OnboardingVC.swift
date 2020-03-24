//
//  OnboardingVC.swift
//  WFFApp
//
//  Created by Vikas on 20/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
class OnboardingVC: UIViewController {
    @IBOutlet weak var nextButton:UIButton!
    @IBOutlet weak var skipButton:UIButton!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var OnboardingCV: UICollectionView!

    var imageList: [UIImage] = [#imageLiteral(resourceName: "onboardingIllustrations1"),#imageLiteral(resourceName: "onboardingIllustrations2"),#imageLiteral(resourceName: "onboardingIllustrations3")]
    var titleList: [String] = ["SHOP FASTER THAN EVER",
    "SCAN FOR FUN IDEAS",
    "TALK TO OUR FRIENDLY BUTCHERS"
    ]
    var subtitleList: [String] = [
        "Welcome to Wild Fork Foods! We’re now making it easier than ever to shop. Enjoy a personalized experience and reorder your favorites fast.",
        "Scan QR codes in store to get the latest recipe inspiration direct from our personal chef.",
        "Need help navigating our 500+ cuts? \n Chat with our friendly butchers to get personalized recommendations for everyday and special occasions."
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        OnboardingCV.dataSource = self
        OnboardingCV.delegate = self
        OnboardingCV.showsVerticalScrollIndicator = false
        OnboardingCV.showsHorizontalScrollIndicator = false
        OnboardingCV.isPagingEnabled = true
        OnboardingCV.registerCollectionViewCellNib(OnboardingCVC.self)
    }
    @IBAction func didTapSkipButton(){
        let zipcodeVC = Storyboard.start.instanceOf(viewController: ZipCodeVC.self)!
        pushViewController(zipcodeVC)
    }
    @IBAction func nextPressed(_ sender: Any) {
        if skipButton.isHidden{
            let zipcodeVC = Storyboard.start.instanceOf(viewController: ZipCodeVC.self)!
            pushViewController(zipcodeVC)
        }else{
        UIView.animate(withDuration: 0.3) {
            self.OnboardingCV.contentOffset.x = self.OnboardingCV.contentOffset.x + self.OnboardingCV.frame.width
        }
        }
    }
   
}
extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCVC", for: indexPath) as! OnboardingCVC
//        cell.setOnboardingView(image: imageList[indexPath.row], title: titleList[indexPath.row], subtitle: subtitleList[indexPath.row])
        cell.onboardingImage.image = imageList[indexPath.row]
        cell.onboardingTitle.text = titleList[indexPath.row]
        cell.onboardingSubtitle.text = subtitleList[indexPath.row]
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int( scrollView.contentOffset.x / scrollView.frame.width )
        self.pageController.currentPage = page
        UIView.animate(withDuration: 0.3) {
            self.skipButton.isHidden = page == (self.titleList.count - 1)
        }
    }
}
