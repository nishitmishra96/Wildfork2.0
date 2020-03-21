//
//  SplashVC.swift
//  WFFApp
//
//  Created by Himanshu Singh on 21/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import UIKit
import AVKit
extension UserDefaults{
    static var isIntroShown:Bool{
        set{
            UserDefaults.standard.set(true, forKey: "INTROSHOWN")
        }
        get{
            return UserDefaults.standard.value(forKey: "INTROSHOWN") as? Bool ?? false
        }
    }
    static var userZipCode:String?{
        set{
            UserDefaults.standard.setValue(newValue, forKey: "USERZIPCODE")
        }
        get{
            return UserDefaults.standard.value(forKey: "USERZIPCODE") as? String
        }
    }
}
class SplashVC: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let vc = Storyboard.home.instanceOf(viewController: TabBarVC.self)!
               let navigationController = UINavigationController(rootViewController: vc)
               AppDelegate.shared().window?.rootViewController = navigationController
               AppDelegate.shared().window?.makeKeyAndVisible()
        return
        self.pushViewController(Storyboard.start.instanceOf(viewController: OnboardingVC.self)!)
    }
}
