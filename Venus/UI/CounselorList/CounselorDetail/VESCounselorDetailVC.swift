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
    
    // Detail information
    @IBOutlet weak var universityLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var degreeLbl: UILabel!
    @IBOutlet weak var majorLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var companyLocationLbl: UILabel!
    @IBOutlet weak var companyPositionLbl: UILabel!
    
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
        
        let detailInfo = data["detail"] as! Dictionary<String, Any>
        updateUIDetail(detailInfo)
    }
    
    private func updateUIDetail(_ detail: Dictionary<String, Any>) {
        let university = detail["university"] as? String
        let location = detail["location"] as? String
        let degree = detail["degree"] as? String
        let major = detail["major"] as? String
        let company = detail["company"] as? String
        let comLocation = detail["com_location"] as? String
        let position = detail["position"] as? String
        
        universityLbl.text = university
        locationLbl.text = location
        degreeLbl.text = degree
        majorLbl.text = major
        companyLbl.text = company
        companyLocationLbl.text = comLocation
        companyPositionLbl.text = position
    }
}
