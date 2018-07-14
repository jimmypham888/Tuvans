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
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    @IBAction func didTapSignUp(_ sender: UIButton) {
        _ = validateEmailAndPassword(success: { (email, password) in
            SVProgressHUD.show()
            VESAuthenticationService.signUpWith(email, password, success: { (result) in
                SVProgressHUD.dismiss()
                print(result)
                VESAppDelegate.shared.loginSuccess()
            }) { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        })
    }
    
    @IBAction func didTapSignIn(_ sender: UIButton) {
        _ = validateEmailAndPassword(success: { (email, password) in
            SVProgressHUD.show()
            VESAuthenticationService.loginWith(email, password, success: { (result) in
                SVProgressHUD.dismiss()
                print(result)
                VESAppDelegate.shared.loginSuccess()
            }) { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        })
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
    
    private func validateEmailAndPassword(success: (_ email: String, _ password: String) -> ()) -> Bool {
        guard let email = emailTf.text, email.count > 0 else {
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập email!")
            emailTf.becomeFirstResponder()
            return false
        }
        
        if !email.isValidEmail() {
            emailTf.becomeFirstResponder()
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập lại email!")
            return false
        }
        
        guard let password = passwordTf.text, password.count > 0 else {
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập mật khẩu!")
            passwordTf.becomeFirstResponder()
            return false
        }
        
        success(email, password)
        
        return true
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

