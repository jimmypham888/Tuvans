//
//  VESTabBarVC.swift
//  Venus
//
//  Created by Jimmy Pham on 6/24/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESTabBarVC: VESBaseTabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let counselorListFlow = FlowManager.flowWith(.counselor)
        counselorListFlow.tabBarItem = UITabBarItem(title: "Danh sách cố vấn", image: nil, tag: 0)
            
        viewControllers = [counselorListFlow]
        tabBar.isTranslucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
