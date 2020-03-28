//
//  SplashVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import AVKit
import WffPlatform

class SplashVC: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.backgroundColor = .white
        self.showsPlaybackControls = false
        let videoURL = URL(fileReferenceLiteralResourceName: "splashvideo.mov")
        let player = AVPlayer(url: videoURL)
        self.player = player
        self.player?.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: .main) { [weak self] _ in
            self?.didSplashEnd()
        }
        // Do any additional setup after loading the view.
    }
    private func didSplashEnd(){
        if UserDefaults.isIntroShown{
            if let _ = UserDefaults.userZipCode{
                self.pushViewController(Storyboard.home.instanceOf(viewController: TabBarVC.self)!)
            }else{
                self.pushViewController(Storyboard.start.instanceOf(viewController: ZipCodeVC.self)!)
            }
        }else{
            self.pushViewController(Storyboard.start.instanceOf(viewController: OnboardingVC.self)!)

        }
    }
}
