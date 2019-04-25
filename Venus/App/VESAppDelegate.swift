//
//  VESAppDelegate.swift
//  venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import SVProgressHUD
import FacebookCore
import GoogleSignIn
import FirebaseAuth
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import OneSignal

@UIApplicationMain
class VESAppDelegate: UIResponder, UIApplicationDelegate {
    
    class var shared: VESAppDelegate {
        return UIApplication.shared.delegate as! VESAppDelegate
    }
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = self.window ?? UIWindow()
        window!.backgroundColor = .white
        
//        setupWithoutTabBar()
//        setupTabBar()
//        setupLoginFlow()
        
        MSAppCenter.start("a636e34a-fc04-43a8-901f-888dc44d25d1", withServices: [MSAnalytics.self, MSCrashes.self])
        
        // Facebook Configuration
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        // ==============
        
        // IQKeyboardManager Configuration
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        // ==============
        
        // Firebase Configuration
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = "773698577966-p9tjh2752b4utldclh2v6hebdl2l0275.apps.googleusercontent.com"
        // ==============
        
        // Other
        SVProgressHUD.setMinimumDismissTimeInterval(0.65)
        // ==============
        
        // AppCenter
        let services: [AnyClass] = [MSAnalytics.self, MSCrashes.self]
        MSAppCenter.start(AppCenterSecret, withServices: services)
        // ==============
        
        // OneSignal Code
        
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]
        
        // Replace 'YOUR_APP_ID' with your OneSignal App ID.
        OneSignal.initWithLaunchOptions(launchOptions,
                                        appId: "22182804-0700-4d5e-9d16-93260a0cea6e",
                                        handleNotificationAction: nil,
                                        settings: onesignalInitSettings)
        
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
        
        // Recommend moving the below line to prompt for push after informing the user about
        //   how your app will use them.
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
        })
        
        // ==============
        let currentUser = Auth.auth().currentUser
        
        if let _currentUser = currentUser {
            
            OneSignal.sendTags(["uid": _currentUser.uid], onSuccess: { (successDict) in
                if let _successDict = successDict {
                    print(_successDict)
                }
            }) { (error) in
                if let _error = error {
                    print(_error)
                }
            }
            
            setupTabBar()
        } else {
            setupLoginFlow()
        }
//
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        let ggHandle = GIDSignIn.sharedInstance().handle(url,
                                                         sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                         annotation: [:])
        let fbHandle = SDKApplicationDelegate.shared.application(app, open: url, options: options)
        return fbHandle || ggHandle
    }
    
    private func setupLoginFlow() {
        let loginFlow = VESBaseNavigationController(rootViewController: VESLoginVC())
        changeRoot(loginFlow)
    }
    
    private func setupWithoutTabBar() {
        let counselorListVC = VESCounselorListVC()
        let navController = VESBaseNavigationController(rootViewController: counselorListVC)
        navController.makeRootView()
    }
    
    func loginSuccess() {
        setupTabBar()
    }
    
    func logoutSuccess() {
        setupLoginFlow()
    }
    
    private func setupTabBar() {
        let tabBar = VESTabBarVC()
        changeRoot(tabBar)
    }
    
    private func changeRoot(_ vc: UIViewController)  {
        var options = UIWindow.TransitionOptions(direction: .fade, style: .easeOut)
        options.duration = 0.4
        window!.setRootViewController(vc, options: options)
    }
    
}
