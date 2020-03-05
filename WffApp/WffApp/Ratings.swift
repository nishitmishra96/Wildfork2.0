//
//  Ratings.swift
//  WffApp
//
//  Created by Nishit Mishra on 05/03/20.
//  Copyright © 2020 Nishit Mishra. All rights reserved.
//

import Foundation
import StoreKit

struct StoreReviewHelper {
    static func incrementAppOpenedCount() {
        guard var appOpenCount = UserDefaults.standard.value(forKey: AppKeys.APP_OPENED_COUNT.key) as? Int else {
            UserDefaults.standard.set(1, forKey: AppKeys.APP_OPENED_COUNT.key)
            UserDefaults.standard.set(Date(), forKey: AppKeys.LaunchTime.key)
            return
        }
        appOpenCount += 1
        UserDefaults.standard.set(appOpenCount, forKey: AppKeys.APP_OPENED_COUNT.key)
        checkAndAskForReview(appOpenCount: appOpenCount)
    }
    static func checkAndAskForReview(appOpenCount:Int) {
        if UserDefaults.standard.value(forKey: AppKeys.RatedTheApp.key) == nil && UserDefaults.standard.value(forKey: AppKeys.NoThanks.key) == nil{
            switch appOpenCount {
            case 3,6:
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 120) {
                    StoreReviewHelper().showAlert()
                    return
                }
            default:
                print("App run count is : \(appOpenCount)")
                break;
            }
            
            if calculateDaysBetweenTwoDates(start: UserDefaults.standard.value(forKey: AppKeys.LaunchTime.key) as! Date , end: Date()){
                print("Entered")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 120) {
                    StoreReviewHelper().showAlert()
                }
            }
        }else{
            return
        }
    }

    func showAlert(){
        if UserDefaults.standard.value(forKey: AppKeys.RatingPopUpCount.key) == nil{
            UserDefaults.standard.set(0, forKey: AppKeys.RatingPopUpCount.key)
        }
        let ratingPopUpCount = UserDefaults.standard.value(forKey: AppKeys.RatingPopUpCount.key) as? Int
        let newValue = /ratingPopUpCount + 1
        UserDefaults.standard.set(newValue, forKey: AppKeys.RatingPopUpCount.key)
        let alert = UIAlertController(title: "Enjoying Wild Fork Foods?", message: "Tap a star to rate it on the App Store.", preferredStyle: .alert)
        let noThanks = UIAlertAction(title: "No, Thanks", style: .destructive){ (action) in
            UserDefaults.standard.set(true, forKey: AppKeys.NoThanks.key)
        }
        let remindMeLater = UIAlertAction(title: "Remind Me Later", style: .cancel){ (action) in
            UserDefaults.standard.set(true, forKey: AppKeys.RemindMeLater.key)
        }
        let rateItNow = UIAlertAction(title: "Rate It Now", style: .default) { (action) in
            SKStoreReviewController.requestReview()
            UserDefaults.standard.set(true, forKey: AppKeys.RatedTheApp.key)
        }
        alert.addAction(rateItNow)
        alert.addAction(remindMeLater)
        alert.addAction(noThanks)
        if newValue <= 2{
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }else{
            print("Rating already asked")
        }

    }
    static func calculateDaysBetweenTwoDates(start: Date, end: Date) -> Bool {
        return Calendar.current.dateComponents([.day], from: start, to: end).day ?? 0 > 60
    }
    
}
