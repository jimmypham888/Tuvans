//
//  VESBookingSuccessViewController.swift
//  Venus
//
//  Created by Jimmy Pham on 7/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESBookingSuccessViewController: VESBaseViewController {

    @IBAction func didTapBack(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}
