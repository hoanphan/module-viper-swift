//
//  String+Extension.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import Foundation
extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func removeExtraSpaces() -> String {
        let squashed = self.replacingOccurrences(of: "[ ]+", with: " ", options: .regularExpression, range: nil)
        #if os(Linux) // Caused by a Linux bug with emoji.
        return squashed
        #else
        return squashed.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        #endif
    }
    
    func convertStringToDateWithDateFormat(dateFormat: String) -> Date? {
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "vi_VN")
        dateFormater.timeZone = TimeZone.current
        dateFormater.dateFormat = dateFormat
        var date =  dateFormater.date(from: self)
        var localTimeZoneAbbreviation =  TimeZone.current.abbreviation()
        localTimeZoneAbbreviation =  localTimeZoneAbbreviation?.replacingOccurrences(of: "GMT", with: "")
        if date == nil
        {
            return date
        }
        if !localTimeZoneAbbreviation!.isEmpty
        {
            let calendar = Calendar.current
            date = calendar.date(byAdding: .hour, value: Int(localTimeZoneAbbreviation!)!, to: date!)
        }
        return date
    }
    
    func replacing(pattern: String, withTemplate: String) throws -> String {
        let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        return regex.stringByReplacingMatches(in: self, options: [],
                                              range: NSRange(0..<self.utf16.count), withTemplate: withTemplate)
    }
    
    
    
    static func checkContentMessage(text: String, rule: String) -> Bool {
        let emailRegEx = rule
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx, options: [])
            let matches = regex.matches(in: text, options: [], range: NSRange(location: 0,
                                                                              length: text.count))
            if !matches.isEmpty {
                return true
            }
            return false
        } catch {
            return false
        }
    }
    func isInt() -> Bool {
        
        if let intValue = Int(self) {
            
            if intValue >= 0 {
                return true
            }
        }
        
        return false
    }
    
    func isFloat() -> Bool {
        
        if let floatValue = Float(self) {
            
            if floatValue >= 0 {
                return true
            }
        }
        
        return false
    }
    
    func isDouble() -> Bool {
        
        if let doubleValue = Double(self) {
            
            if doubleValue >= 0 {
                return true
            }
        }
        
        return false
    }
    
    func numberOfCharacters() -> Int {
        return self.characters.count
    }
    
}
extension DateFormatter {
    func toDate(str: String) -> Date?
    {
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        var date = self.date(from: str)
        var localTimeZoneAbbreviation =  TimeZone.current.abbreviation()
        localTimeZoneAbbreviation =  localTimeZoneAbbreviation?.replacingOccurrences(of: "GMT", with: "")
        if date == nil
        {
            return date
        }
        if !localTimeZoneAbbreviation!.isEmpty
        {
            let calendar = Calendar.current
            date = calendar.date(byAdding: .hour, value: Int(localTimeZoneAbbreviation!)!, to: date!)
        }
        return date
    }
}
