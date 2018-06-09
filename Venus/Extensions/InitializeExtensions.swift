//
//  InitializeExtensions.swift
//  venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import UIKit

extension UIViewController {
    convenience init(nibName: String) {
        self.init(nibName: nibName, bundle: .main)
    }
}

extension CGSize {
    init(w: CGFloat, h: CGFloat) {
        self.init(width: w, height: h)
    }
}

extension CGRect {
    init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(x: x, y: y, width: w, height: h)
    }
}

extension UIView {
    convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
    }
}
