//
//  UIButtonExtensions.swift
//  Venus
//
//  Created by Jimmy Pham on 7/24/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setColor(name: ColorName) {
        let _color = UIColor(named: name)
        setTitleColor(_color, for: .normal)
    }
    
}
