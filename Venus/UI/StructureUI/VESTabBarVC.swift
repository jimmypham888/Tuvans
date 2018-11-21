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
        
        tabBar.tintColor = .white
        tabBar.barTintColor = UIColor(named: .lightNavy)
        
        let counselorListFlow = FlowManager.flowWith(.counselor)
        counselorListFlow.tabBarItem = UITabBarItem(title: "Tìm kiếm", image: Asset.searchTabBar.image, tag: 0)
        
        let scheduleFlow = FlowManager.flowWith(.schedule)
        scheduleFlow.tabBarItem = UITabBarItem(title: "Lịch hẹn", image: Asset.schedule.image, tag: 1)
        
        let settingFlow = FlowManager.flowWith(.setting)
        settingFlow.tabBarItem = UITabBarItem(title: "Setting", image: Asset.account24.image, tag: 2)
            
        viewControllers = [counselorListFlow, scheduleFlow, settingFlow]
        tabBar.isTranslucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
