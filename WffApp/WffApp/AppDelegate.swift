//
//  AppDelegate.swift
//  WffApp
//
//  Created by Nishit Mishra on 05/03/20.
//  Copyright © 2020 Nishit Mishra. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCrashlytics
import FirebaseMessaging
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        let splashVC = Storyboard.main.instanceOf(viewController: LaunchScreenWithGIFViewController.self)!
        splashVC.launchOptions = launchOptions
        let navigationController = UINavigationController.init(rootViewController: splashVC)
        navigationController.navigationBar.isTranslucent = false
        navigationController.isNavigationBarHidden = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        AppDelegate.shared().window?.rootViewController = navigationController
        AppDelegate.shared().window?.makeKeyAndVisible()
        registerForPushNotifications()
        return true
    }
   class func shared() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        print(deviceToken.reduce("", {$0 + String(format: "%02X", $1)}))
        Messaging.messaging().apnsToken = deviceToken
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .badge, .sound])
    }
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            guard granted else {
                return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UNUserNotificationCenter.current().delegate = self
                UIApplication.shared.registerForRemoteNotifications()
            }
            
        }
    }
}
