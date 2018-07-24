//
//  VESSettingVC.swift
//  Venus
//
//  Created by Jimmy Pham on 7/14/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESSettingVC: VESBaseViewController {
    
    @IBAction func didTapSignOut(_ sender: UIButton) {
        VESAuthenticationService.logout()
        VESAppDelegate.shared.logoutSuccess()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
    }
    
    private func initLayout() {
        wrraperView.setBackgroundColor(name: .lightBlueGrey)
    }
}
