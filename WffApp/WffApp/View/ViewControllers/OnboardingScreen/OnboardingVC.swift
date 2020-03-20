//
//  OnboardingVC.swift
//  WFFApp
//
//  Created by Vikas on 20/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
//struct onBoardingView{
//    var image:UIImage
//    var title:String
//    var subTitle:String
//}
class OnboardingVC: UIViewController {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var OnboardingCV: UICollectionView!
    var counter = 0
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

        // Do any additional setup after loading the view.
        OnboardingCV.dataSource = self
        OnboardingCV.delegate = self
        OnboardingCV.registerCollectionViewCellNib(OnboardingCVC.self)
        OnboardingCV.isUserInteractionEnabled = false
        
    }
    override func viewDidAppear(_ animated: Bool) {
        counter = 0
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if counter < 2 {
            counter += 1
            let index = IndexPath.init(item: counter, section: 0)
            self.OnboardingCV.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageController.currentPage = counter
        }
        else {
            let zipcodeVC = UIStoryboard.init(name: "StartFlow", bundle: .main).instantiateViewController(withIdentifier: "ZipCodeVC") as! ZipCodeVC
            pushViewController(zipcodeVC)
        }
    }
    @IBAction func skipPressed(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.contentSize.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCVC", for: indexPath) as! OnboardingCVC
        cell.setOnboardingView(image: imageList[indexPath.row], title: titleList[indexPath.row], subtitle: subtitleList[indexPath.row])
        cell.width.constant = UIScreen.main.bounds.width
        return cell
    }
    
    
}
