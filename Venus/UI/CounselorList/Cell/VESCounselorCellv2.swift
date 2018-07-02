//
//  VESCounselorCellv2.swift
//  Venus
//
//  Created by Jimmy Pham on 7/1/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESCounselorCellv2: VESBaseTableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var counselorImage: UIImageView!
    @IBOutlet weak var infoStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWith(dict: Dictionary<String, Any>) {
        nameLbl.text = dict["name"] as? String
        descLbl.text = dict["desc"] as? String
        counselorImage.image = UIImage(named: dict["image"] as! String)
        
        let infoArray = dict["intro"] as! [String]
        
        for (idx, subView) in infoStackView.arrangedSubviews.enumerated() {
            (subView as! UILabel).text = infoArray[idx]
        }
    }
    
}
