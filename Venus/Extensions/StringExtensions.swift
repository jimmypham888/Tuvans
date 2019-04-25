//
//  StringExtensions.swift
//  venus
//
//  Created by Jimmy Pham on 6/9/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}

class ConverHelper {
    private static let arrCoDau: [Character] =
        ["á","à","ả","ã","ạ",
         "ă","ắ","ằ","ẳ","ẵ","ặ",
         "â","ấ","ầ","ẩ","ẫ","ậ",
         "đ",
         "é","è","ẻ","ẽ","ẹ",
         "ê","ế","ề","ể","ễ","ệ",
         "í","ì","ỉ","ĩ","ị",
         "ó","ò","ỏ","õ","ọ",
         "ô","ố","ồ","ổ","ỗ","ộ",
         "ơ","ớ","ờ","ở","ỡ","ợ",
         "ú","ù","ủ","ũ","ụ",
         "ư","ứ","ừ","ử","ữ","ự",
         "ý","ỳ","ỷ","ỹ","ỵ",
         
         "Á","À","Ả","Ã","Ạ",
         "Ă","Ắ","Ằ","Ẳ","Ẵ","Ặ",
         "Â","Ấ","Ầ","Ẩ","Ẫ","Ậ",
         "Đ",
         "É","È","Ẻ","Ẽ","Ẹ",
         "Ê","Ế","Ề","Ể","Ễ","Ệ",
         "Í","Ì","Ỉ","Ĩ","Ị",
         "Ó","Ò","Ỏ","Õ","Ọ",
         "Ô","Ố","Ồ","Ổ","Ỗ","Ộ",
         "Ơ","Ớ","Ờ","Ở","Ỡ","Ợ",
         "Ú","Ù","Ủ","Ũ","Ụ",
         "Ư","Ứ","Ừ","Ử","Ữ","Ự",
         "Ý","Ỳ","Ỷ","Ỹ","Ỵ"]
    
    private static let arrKhongDau: [Character] =
        ["a","a","a","a","a",
         "a","a","a","a","a","a",
         "a","a","a","a","a","a",
         "d",
         "e","e","e","e","e",
         "e","e","e","e","e","e",
         "i","i","i","i","i",
         "o","o","o","o","o",
         "o","o","o","o","o","o",
         "o","o","o","o","o","o",
         "u","u","u","u","u",
         "u","u","u","u","u","u",
         "y","y","y","y","y",
         
         "A","A","A","A","A",
         "A","A","A","A","A","A",
         "A","A","A","A","A","A",
         "D",
         "E","E","E","E","E",
         "E","E","E","E","E","E",
         "I","I","I","I","I",
         "O","O","O","O","O",
         "O","O","O","O","O","O",
         "O","O","O","O","O","O",
         "U","U","U","U","U",
         "U","U","U","U","U","U",
         "Y","Y","Y","Y","Y"
    ]
    
    class func convertVietNam(text: String) -> String {
        let newChar = text.map { (char) -> Character in
            if let index = arrCoDau.firstIndex(of: char) {
                return arrKhongDau[index]
            } else {
                return char
            }
        }
        return String(newChar)
    }
}
