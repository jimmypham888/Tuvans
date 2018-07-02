//
//  VESBaseViewController.swift
//  venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit
import SVProgressHUD
import SnapKit

class VESBaseViewController: UIViewController {
    
    @IBOutlet weak var wrraperView: UIView!
    
    init() {
        super.init(nibName: String.className(type(of: self)), bundle: .main)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remakeWrapperView(wrraperView)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setEndEditing() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    internal func remakeWrapperView(_ wrapperView: UIView) {
        if ProcessInfo.isOperatingSystemBelowVersion(11) {
            wrapperView.removeFromSuperview()
            view.addSubview(wrapperView)
            wrapperView.snp.makeConstraints {
                $0.left.right.equalToSuperview()
                $0.top.equalTo(topLayoutGuide.snp.bottom)
                $0.bottom.equalTo(bottomLayoutGuide.snp.top)
            }
        }
    }
    
    internal func makeRootView() {
        var options = UIWindow.TransitionOptions(direction: .fade, style: .easeOut)
        options.duration = 0.4
        VESAppDelegate.shared.window!.setRootViewController(self)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
