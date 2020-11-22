//
//  AppConfig.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import UIKit
class AppConfig: NSObject {
    
    static let shared = AppConfig()
    
    private override init() {
        super.init()
        initDefaultValue()
    }
    
    // Global Vars Across The Entire App ..
    var _launchOptions = [UIApplication.LaunchOptionsKey: Any]()
    var _UIApplication:UIApplication?
    
    /// This variable is used to: Handle the internet connection accross the app
    let reachability = try? Reachability()
    
    // MARK: - Init The App Default Values
    func initDefaultValue() {
        
        // Init Reachability
        self.initReachabilityNotifier()
        
        // Finally, start the app
        startTheApp()
    }
    
    // MARK: - App Main Delegate Functions
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Save the launchOptions for later usage ..
        _launchOptions = launchOptions ?? [UIApplication.LaunchOptionsKey: Any]()
        _UIApplication = application
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        application.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func application( _ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    func application( _ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],fetchCompletionHandler completionHandler:@escaping (UIBackgroundFetchResult) -> Void) {
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return true
    }
    
    // MARK: - Init Reachability
    /// This method/function was designed & implemented to: Init the internet reachibility check
    func initReachabilityNotifier() {
        do {
            try reachability?.startNotifier()
        } catch {}
    }
    
    // MARK: - ---------------------------- START THE APP ----------------------------
    func startTheApp() {
        let coord = HomeCoordinator.init(window: appDelegate?.window ?? UIWindow())
        coord.start()
    }
}
