//
//  VESLoginVC.swift
//  Venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESLoginVC: VESBaseViewController {

    @IBOutlet weak var wrapperView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        remakeWrapperView(wrapperView)
    }

}
