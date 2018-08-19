//
//  VESScheduleCell.swift
//  Venus
//
//  Created by Jimmy Pham on 8/18/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

private enum ScheduleConfig {
    case planning
    case scheduled
    case completed
}

class VESScheduleCell: VESBaseTableViewCell {
    
    @IBOutlet weak var nameCounselorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var couselorImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCell()
    }
    
    private func configCell() {
        [dateLbl, stateLbl].forEach {
            $0?.font = FontFamily.OpenSans.regular.font(size: 14.0)
        }
    }
    
    func updateWithData(_ data: [String: Any]) {
        let counselorName = data["counselor"] as? String
        let image = UIImage(named: data["image"] as! String)
        let state = data["state"] as! String
        let date = data["date"] as? String
        
        nameCounselorLbl.text = counselorName
        couselorImageView.image = image
        
        if date == "" {
            dateLbl.text = "Chưa Xác định"
        } else {
            dateLbl.text = date
        }
        
        switch state {
        case "0":
            updateLayoutWithConfig(.planning)
        case "1":
            updateLayoutWithConfig(.scheduled)
        case "2":
            updateLayoutWithConfig(.completed)
        default:
            break
        }
    }
    
    private func updateLayoutWithConfig(_ config: ScheduleConfig) {
        switch config {
        case .planning:
            [dateLbl, stateLbl].forEach {
                $0?.textColor = ColorName.black87.color
            }
            dateLbl.text = "Chưa xác định"
            stateLbl.text = "Chưa lên lịch hẹn"
        case .scheduled:
            dateLbl.textColor = ColorName.lightNavy.color
            stateLbl.textColor = ColorName.dandelion.color
            stateLbl.text = "Đã đặt lịch hẹn"
        case .completed:
            [dateLbl, stateLbl].forEach {
                $0?.textColor = ColorName.lightNavy.color
            }
            stateLbl.text = "Đã hoàn thành"
        }
    }
    
}
