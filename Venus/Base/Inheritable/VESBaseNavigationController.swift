//
//  VESBaseNavigationController.swift
//  venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESBaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isNavigationBarHidden = true
    }
    
    internal func makeRootView() {
        var options = UIWindow.TransitionOptions(direction: .fade, style: .easeOut)
        options.duration = 0.4
        VESAppDelegate.shared.window!.setRootViewController(self)
    }
    
}
