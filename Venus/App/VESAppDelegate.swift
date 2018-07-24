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

@UIApplicationMain
class VESAppDelegate: UIResponder, UIApplicationDelegate {
    
    class var shared: VESAppDelegate {
        return UIApplication.shared.delegate as! VESAppDelegate
    }
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = self.window ?? UIWindow()
        window!.backgroundColor = .white
        
//        setupWithoutTabBar()
//        setupTabBar()
//        setupLoginFlow()
        
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
        
        if Auth.auth().currentUser != nil {
            setupTabBar()
        } else {
            setupLoginFlow()
        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        let ggHandle = GIDSignIn.sharedInstance().handle(url,
                                                         sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
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
