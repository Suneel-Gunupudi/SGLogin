//
//  StringValidateExtension.swift
//  SGLogin
//
//  Created by Suneel Gunupudi on 11/26/18.
//  Copyright © 2018 Suneel. All rights reserved.
//

import Foundation

extension String{
    
    func PhoneNumberFormat() -> String {
        let stringNm: NSMutableString = NSMutableString(string: self)
        stringNm.insert("(", at: 0)
        stringNm.insert(")", at: 4)
        stringNm.insert("-", at: 5)
        stringNm.insert("-", at: 9)
        return stringNm as String
        
    }
    
    var changePhoneNumberFormattoNormal: String {
        var strings = Array(self)
        strings.remove(at: 0)
        strings.remove(at: 3)
        strings.remove(at: 3)
        strings.remove(at: 6)
        let modifiedNumber = String(strings)
        return modifiedNumber
        
    }
    
    var isValidEmail: Bool {
        //[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,} -- Old Regex
        return isMatching(expression:try! NSRegularExpression(pattern: "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"))
        
    }
    
    var isValidPhone: Bool {
        return isMatching(expression:try! NSRegularExpression(pattern: "^(\\d{3}) \\d{3}-\\d{4}$"))
        
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
        
    }
    
    var isNonAlphabetic: Bool {
        return !(!isEmpty && range(of: "[^a-zA-Z ()]", options: .regularExpression) == nil)
        
    }
    
    var isAlphanumericAndSomeSpecialChar: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9- &]", options: .regularExpression) == nil
        
    }
    
    //validate Password
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil){
                
                if(self.count>=6 && self.count<=20){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
        
    }
    
    var isNumeric: Bool{
        let range = self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted)
        return (range == nil)
        
    }
    
    //MARK: - Private
    
    private func isMatching(expression: NSRegularExpression) -> Bool {
        return expression.numberOfMatches(in: self, range: NSRange(location: 0, length: self.count)) > 0
        
    }
    
}
