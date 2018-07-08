//
//  VESBookingCounselorVC.swift
//  Venus
//
//  Created by Jimmy Pham on 7/2/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESBookingCounselorVC: VESBaseViewController {

    @IBAction func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapSend(_ sender: UIButton) {
        navigationController?.pushViewController(VESBookingSuccessViewController(), animated: true)
    }
    
    //    @IBOutlet weak var nameLbl: UILabel!
//    @IBOutlet weak var descLbl: UILabel!
//    @IBOutlet weak var counselorImage: UIImageView!
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
        updateIcon()
        updateUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    private func updateIcon() {
        infoStack.arrangedSubviews
            .compactMap { $0.subviews.first as? UIImageView }
            .forEach { $0.changeColorImage(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6)) }
    }
    
    private func updateUI() {
        let name = data["name"] as! String
        
//        nameLbl.text = name
//        descLbl.text = data["desc"] as? String
//        counselorImage.image = UIImage(named: data["image"] as! String)
        statusLbl.text = "Bạn chọn cố vấn: \(name)"
    }
}
