//
//  VESCounselorDetailVC.swift
//  Venus
//
//  Created by Jimmy Pham on 6/24/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESCounselorDetailVC: VESBaseViewController {

    @IBAction func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didSelectBooking(_ sender: UIButton) {
        navigationController?.pushViewController(VESBookingCounselorVC(detail: data), animated: true)
    }
    
    @IBOutlet weak var bookBtnView: UIView!
    
    @IBAction func didSelectLinkedIn(_ sender: UIButton) {
        guard let linkedin = data["linkedin"] as? String, let url = URL(string: linkedin) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var counselorImage: UIImageView!
    @IBOutlet var degreesCollection: [UILabel]!
    @IBOutlet var jobCollection: [UILabel]!
    
    private let data: Dictionary<String, Any>
    
    init(detail: Dictionary<String, Any>) {
        self.data = detail
        
        super.init()
        
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createShadowForBtn()
        updateUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    private func createShadowForBtn() {
        bookBtnView.layer.cornerRadius = 10
        
        // shadow
        bookBtnView.layer.shadowColor = UIColor.black.cgColor
        bookBtnView.layer.shadowOffset = CGSize(width: 1, height: 1)
        bookBtnView.layer.shadowOpacity = 0.3
        bookBtnView.layer.shadowRadius = 2.0
    }
    
    private func updateUI() {
        nameLbl.text = data["name"] as? String
        descLbl.text = data["desc"] as? String
        counselorImage.image = UIImage(named: data["image"] as! String)
    }
}
