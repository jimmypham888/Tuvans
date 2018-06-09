//
//  VESAppDelegate.swift
//  venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

@UIApplicationMain
class VESAppDelegate: UIResponder, UIApplicationDelegate {
    
    class var shared: VESAppDelegate {
        return UIApplication.shared.delegate as! VESAppDelegate
    }
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = self.window ?? UIWindow()
        window!.backgroundColor = .white
        
        setupLoginFlow()
        
        return true
    }
    
    private func setupLoginFlow() {
        let loginFlow = VESBaseNavigationController(rootViewController: VESLoginVC())
        var options = UIWindow.TransitionOptions(direction: .fade, style: .easeOut)
        options.duration = 0.4
        window!.setRootViewController(loginFlow, options: options)
    }
    
}
