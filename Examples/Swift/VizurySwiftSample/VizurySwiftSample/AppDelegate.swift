//
//  AppDelegate.swift
//  VizurySwiftSample
//
//  Created by Chowdhury Md Rajib  Sarwar on 23/4/20.
//  Copyright © 2020 Chowdhury Md Rajib  Sarwar. All rights reserved.
//

import UIKit
import VizuryEventLogger
import UserNotifications
import VizuryRichNotification


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let PACKAGE_ID = "1"
    let SERVER_URL = "https://www.vizury.com/analyze/analyze.php"
    let DEEP_LINK_KEY = "deeplink"


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        VizuryEventLogger.initializeEventLogger(in: application,
                                                withPackageId: PACKAGE_ID,
                                                serverURL: SERVER_URL,
                                                withCachingEnabled: false,
                                                andWithFCMEnabled: true)
        registerForRemoteNotification(application)
        return true
    }
    
    func registerForRemoteNotification(_ application: UIApplication) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        } else {
            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
        }
        application.registerForRemoteNotifications()
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        VizuryEventLogger.registerForPush(withToken: deviceToken)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        VizuryEventLogger.didFailToRegisterForPush()
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        VizuryEventLogger.didReceiveRemoteNotification(in: application, withUserInfo: userInfo)
        if application.applicationState == UIApplication.State.inactive {
            print("Appilication Inactive - the user has tapped in the notification when app was closed or in background")
            self.customPushHandler(notification: userInfo as NSDictionary)
        }
    }
    
    func customPushHandler(notification: NSDictionary) {
        if notification.object(forKey: DEEP_LINK_KEY) != nil {
            let deeplink = notification.object(forKey: DEEP_LINK_KEY) as! String
            print(deeplink)
        }
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        print(userInfo)
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        VizuryEventLogger.didReceiveResponse(userInfo: userInfo)
        print(userInfo)
        
        completionHandler()
    }
}
