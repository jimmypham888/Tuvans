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
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var counselorImage: UIImageView!
    
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
        updateUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    private func updateUI() {
        nameLbl.text = data["name"] as? String
        descLbl.text = data["desc"] as? String
        counselorImage.image = UIImage(named: data["image"] as! String)
    }
}
