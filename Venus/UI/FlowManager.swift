//
//  FlowManager.swift
//  Venus
//
//  Created by Jimmy Pham on 6/24/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import Foundation
import UIKit

enum FlowType {
    case login
    case counselor
}

final class FlowManager {
    static func flowWith(_ flowCase: FlowType) -> VESBaseNavigationController {
        switch flowCase {
        case .counselor:
            let counselorListVC = VESCounselorListVC()
            let naviCounselorListVC = VESBaseNavigationController(rootViewController: counselorListVC)
            return naviCounselorListVC
        case .login:
            let loginVC = VESLoginVC()
            let naviLoginVC = VESBaseNavigationController(rootViewController: loginVC)
            return naviLoginVC
        }
    }
}
