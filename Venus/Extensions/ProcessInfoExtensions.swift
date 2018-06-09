//
//  ProcessInfoExtensions.swift
//  venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import Foundation

extension ProcessInfo {
    static func isOperatingSystemAtLeastVersion(_ major: Int, _ minor: Int, _ patch: Int) -> Bool {
        return processInfo.isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: major, minorVersion: minor, patchVersion: patch))
    }
    
    static func isOperatingSystemBelowVersion(_ major: Int) -> Bool {
        return !ProcessInfo.isOperatingSystemAtLeastVersion(major, 0, 0)
    }
}
