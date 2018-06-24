//
//  VESCounselorCell.swift
//  Venus
//
//  Created by Jimmy Pham on 6/24/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

class VESCounselorCell: VESBaseTableViewCell {

    @IBAction func didTapCell(_ sender: UIButton) {
        action?()
    }
    
    private var action: (() -> ())?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        action = nil
    }
    
    func updateWith(action: (() -> ())?) {
        self.action = action
    }
    
}
