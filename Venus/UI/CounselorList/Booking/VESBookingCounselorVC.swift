//
//  VESBookingCounselorVC.swift
//  Venus
//
//  Created by Jimmy Pham on 7/2/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import SVProgressHUD

class VESBookingCounselorVC: VESBaseViewController {
    
    var ref: DocumentReference?

    @IBAction func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapSend(_ sender: UIButton) {
        sendbtn.isEnabled = false
        let result = validate { (email, name, notes, number) in
            uploadCustomerInfo(name: name,
                               email: email,
                               telNumber: number,
                               notes: notes,
                               counselor: data["name"] as! String)
        }
        
        if !result {
            sendbtn.isEnabled = true
        }
    }

    @IBOutlet weak var sendbtn: UIButton!
    @IBOutlet weak var messageLbl: UITextField!
    @IBOutlet weak var phoneNumberLbl: UITextField!
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var infoStack: UIStackView!
    
    private let data: Dictionary<String, Any>
    
    init(detail: Dictionary<String, Any>) {
        self.data = detail
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        updateUI()
        
        setEndEditing()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    private func update() {
        infoStack.arrangedSubviews
            .compactMap { $0.subviews.first as? UIImageView }
            .forEach { $0.changeColorImage(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6)) }
        
        infoStack.arrangedSubviews
            .compactMap { $0.subviews[1] as? UITextField }
            .forEach { $0.delegate = self }
    }
    
    private func validate(success:(String, String, String, String) -> ()) -> Bool {
        
        guard let name = nameLbl.text, name.count > 2 else {
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập đầy đủ họ tên!")
            nameLbl.becomeFirstResponder()
            return false
        }
        
        guard let email = emailLbl.text, email.count > 0 else {
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập email!")
            emailLbl.becomeFirstResponder()
            return false
        }
        
        if !email.isValidEmail() {
            emailLbl.becomeFirstResponder()
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập lại email!")
            return false
        }
        
        guard let tel = phoneNumberLbl.text, tel.isPhoneNumber else {
            phoneNumberLbl.becomeFirstResponder()
            SVProgressHUD.showInfo(withStatus: "Vui lòng nhập chính xác số điện thoại!")
            return false
        }
        
        success(email, name, messageLbl.text ?? "", tel)
        
        return true
    }
    
    private func uploadCustomerInfo(name: String,
                                    email: String,
                                    telNumber: String,
                                    notes: String,
                                    counselor: String) {
        SVProgressHUD.show()
        ref = Firestore.firestore().collection("customer").addDocument(data: [
            "email": email,
            "name": name,
            "notes": notes,
            "number": telNumber,
            "counselor": counselor
        ]) { (err) in
            SVProgressHUD.dismiss()
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.navigationController?.pushViewController(VESBookingSuccessViewController(), animated: true)
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }
    }
    
    private func updateUI() {
        let name = data["name"] as! String
        statusLbl.text = "Bạn chọn cố vấn: \(name)"
    }
}

extension VESBookingCounselorVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
