//
//  PlistUtility.swift
//  Venus
//
//  Created by Jimmy Pham on 7/1/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import Foundation

class PlistUtility {
    class func ReadPlist(_ fileName: String) -> NSDictionary {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "plist") else { return [:] }
        
        do {
            let data = try Data(contentsOf: url)
            let swiftDictionary = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! NSDictionary
            
            return swiftDictionary
        } catch {
            print(error)
        }
        
        return [:]
    }
    
    class func ReadPlistArrayString(_ fileName: String) -> [String] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "plist") else { return [] }
        
        return NSArray(contentsOf: url) as! [String]
    }
    
    class func ReadPlistArray(_ fileName: String) -> [Dictionary<String,Any>] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "plist") else { return [] }
        
        return NSArray(contentsOf: url) as! [Dictionary<String, Any>]
    }
}
