//
//  VESLoginVC.swift
//  Venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit
import GoogleSignIn
import SVProgressHUD

class VESLoginVC: VESBaseViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    @IBAction func didTapSignOut(_ sender: UIButton) {
        VESAuthenticationService.logout()
    }
    
    @IBAction func didTapLoginGoogle(_ sender: UIButton) {
        SVProgressHUD.show()
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func didTapLoginFacebook(_ sender: UIButton) {
        SVProgressHUD.show()
        VESAuthenticationService.facebookLogin(viewController: self, success: { (result) in
            SVProgressHUD.dismiss()
            print(result)
            VESAppDelegate.shared.loginSuccess()
        }) { (error) in
            SVProgressHUD.dismiss()
            print(error.localizedDescription)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        present(viewController, animated: true, completion: nil)
    }

    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let authentication = user.authentication else { return }
        VESAuthenticationService.googleLogin(authentication, success: { (result) in
            print(result)
            SVProgressHUD.dismiss()
            VESAppDelegate.shared.loginSuccess()
        }) { (error) in
            SVProgressHUD.dismiss()
            print(error.localizedDescription)
        }
    }
}

