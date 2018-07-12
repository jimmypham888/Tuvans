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
import FirebaseDatabase

@UIApplicationMain
class VESAppDelegate: UIResponder, UIApplicationDelegate {
    
    class var shared: VESAppDelegate {
        return UIApplication.shared.delegate as! VESAppDelegate
    }
    
    var window: UIWindow?
    
    var ref: DatabaseReference!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = self.window ?? UIWindow()
        window!.backgroundColor = .white
        
        setupWithoutTabBar()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        
        FirebaseApp.configure()
        ref = Database.database().reference()
        
        return true
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
