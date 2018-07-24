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
    
    @IBOutlet weak var regNameTf: UITextField!
    @IBOutlet weak var regEmailTf: UITextField!
    @IBOutlet weak var regPasswordTf: UITextField!
    
    @IBOutlet weak var loginEmailTf: UITextField!
    @IBOutlet weak var loginPasswordTf: UITextField!
    
    @IBOutlet weak var regView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var regBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var loginStackView: UIStackView!
    
    @IBOutlet weak var loginOtherWrapperView: UIView!
    @IBOutlet weak var regWrapperView: UIView!
    
    @IBOutlet weak var mainLoginBtn: UIButton!
    @IBOutlet weak var mainRegBtn: UIButton!
    @IBOutlet weak var regLbl: UILabel!
    @IBOutlet weak var loginLbl: UILabel!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var regShowPasswordBtn: UIButton!
    @IBOutlet weak var loginShowPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        initLayout()
        setEndEditing()
    }
    
    private func initLayout() {
        regBtn.setColor(name: .lightNavy)
        loginBtn.setColor(name: .black60)
        wrraperView.setBackgroundColor(name: .lightBlueGrey)
        
        [stackView, loginStackView].forEach {
            $0.arrangedSubviews.forEach { (sv) in
                let backgroundColor = UIColor(named: .black87).withAlphaComponent(0.08)
                sv.setBackgroundColor(color: backgroundColor)
                (sv.subviews.first!.subviews.first! as! UIImageView).changeColorImage(name: .black54)
                let tf = sv.subviews[1] as! UITextField
                tf.textColor = UIColor(named: .black60)
                tf.attributedPlaceholder = NSAttributedString(string: tf.text!, attributes: [.foregroundColor: UIColor(named: .black60)])
                tf.tintColor = UIColor(named: .black60)
                tf.text = nil
            }
        }
        
        mainRegBtn.setBackgroundColor(name: .lightNavy)
        regLbl.textColor = UIColor(named: .black60)
        loginLbl.textColor = UIColor(named: .black60)
        
        [regNameTf, regEmailTf, regPasswordTf, loginEmailTf, loginPasswordTf].forEach { $0?.delegate = self }
        
        [regShowPasswordBtn, loginShowPasswordBtn].forEach { $0?.tintColor = UIColor(named: .black54) }
    }
    
    
    
    private func changeToLoginView() {
        regView.isHidden = true
        loginView.isHidden = false
        loginOtherWrapperView.isHidden = false
        regWrapperView.isHidden = true
        regBtn.setColor(name: .black60)
        loginBtn.setColor(name: .lightNavy)
        
        UIView.animate(withDuration: 0.2) {
            self.leadingConstraint.constant = 156
            self.view.layoutIfNeeded()
        }
    }
    
    private func changeToRegView() {
        regView.isHidden = false
        loginView.isHidden = true
        loginOtherWrapperView.isHidden = true
        regWrapperView.isHidden = false
        regBtn.setColor(name: .lightNavy)
        loginBtn.setColor(name: .black60)
        
        UIView.animate(withDuration: 0.2) {
            self.leadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func didTapShowPassword(_ sender: UIButton) {
        if sender == regShowPasswordBtn {
            regPasswordTf.isSecureTextEntry = !regPasswordTf.isSecureTextEntry

            if regPasswordTf.isFirstResponder {
                regPasswordTf.becomeFirstResponder()
            }
            
            let selectedTextRange = regPasswordTf.selectedTextRange
            regPasswordTf.selectedTextRange = nil
            regPasswordTf.selectedTextRange = selectedTextRange
        } else if sender == loginShowPasswordBtn {
            loginPasswordTf.isSecureTextEntry = !loginPasswordTf.isSecureTextEntry
            
            let selectedTextRange = loginPasswordTf.selectedTextRange
            loginPasswordTf.selectedTextRange = nil
            loginPasswordTf.selectedTextRange = selectedTextRange
        }
    }
    
    @IBAction func didTapLoginView(_ sender: UIButton) {
        changeToLoginView()
    }
    
    @IBAction func didTapRegView(_ sender: UIButton) {
        changeToRegView()
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
                SVProgressHUD.showError(withStatus: error.localizedDescription)
            }
        })
    }
    
    @IBAction func didTapSignIn(_ sender: UIButton) {
        _ = validateEmailAndPasswordForSignin(success: { (email, password) in
            SVProgressHUD.show()
            VESAuthenticationService.loginWith(email, password, success: { (result) in
                SVProgressHUD.dismiss()
                print(result)
                VESAppDelegate.shared.loginSuccess()
            }) { (error) in
                SVProgressHUD.dismiss()
                SVProgressHUD.showError(withStatus: error.localizedDescription)
            }
        })
    }
    
    @IBAction func didTapLoginGoogle(_ sender: UIButton) {
        SVProgressHUD.show()
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func didTapLoginFacebook(_ sender: UIButton) {
        VESAuthenticationService.facebookLogin(viewController: self, success: { (result) in
            print(result)
            VESAppDelegate.shared.loginSuccess()
        }) { (error) in
            SVProgressHUD.showError(withStatus: error.localizedDescription)
        }
    }
    
    private func validateEmailAndPasswordForSignin(success: (_ email: String, _ password: String) -> ()) -> Bool {
        guard let email = loginEmailTf.text, email.count > 0 else {
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập email!")
            regEmailTf.becomeFirstResponder()
            return false
        }
        
        if !email.isValidEmail() {
            loginEmailTf.becomeFirstResponder()
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập lại email!")
            return false
        }
        
        guard let password = loginPasswordTf.text, password.count > 0 else {
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập mật khẩu!")
            loginPasswordTf.becomeFirstResponder()
            return false
        }
        
        success(email, password)
        
        return true
    }
    
    private func validateEmailAndPassword(success: (_ email: String, _ password: String) -> ()) -> Bool {
        guard let email = regEmailTf.text, email.count > 0 else {
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập email!")
            regEmailTf.becomeFirstResponder()
            return false
        }
        
        if !email.isValidEmail() {
            regEmailTf.becomeFirstResponder()
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập lại email!")
            return false
        }
        
        guard let password = regPasswordTf.text, password.count > 0 else {
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập mật khẩu!")
            regPasswordTf.becomeFirstResponder()
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
            SVProgressHUD.dismiss()
            print(result)
            VESAppDelegate.shared.loginSuccess()
        }) { (error) in
            SVProgressHUD.dismiss()
            SVProgressHUD.showError(withStatus: error.localizedDescription)
        }
    }
}

extension VESLoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
