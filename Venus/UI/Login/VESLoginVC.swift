//
//  VESLoginVC.swift
//  Venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit
import AWSAuthCore
import AWSAuthUI

class VESLoginVC: VESBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSignIn()
    }
    
    private func showSignIn() {
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController.presentViewController(with: self.navigationController!,
                                                          configuration: nil,
                                                          completionHandler: { (provider: AWSSignInProvider, error: Error?) in
                                                            if error != nil {
                                                                print("Error occurred: \(String(describing: error))")
                                                            } else {
                                                                // Sign in successful.
                                                            }
            })
        }
    }

    @IBAction func didTapSignOut(_ sender: UIButton) {
        AWSSignInManager.sharedInstance().logout(completionHandler: {(result: Any?, error: Error?) in
            self.showSignIn()
            // print("Sign-out Successful: \(signInProvider.getDisplayName)");
            
        })
    }
}
