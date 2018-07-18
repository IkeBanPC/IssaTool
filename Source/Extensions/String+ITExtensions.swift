//
//  String+ITExtensions.swift
//  IssaTool
//
//  Created by Isaac on 2018/7/18.
//  Copyright © 2018年 IsaacPan. All rights reserved.
//
public extension String {
    
    /// returns a substring created by specific range of current string, if given range is out of index, returns the whole string.
    ///
    /// - Parameter r: range
    public subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(self.count, r.lowerBound)), upper: min(self.count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    
    /// returns the specific character as a string of given subscript like an array.
    ///
    /// - Parameter i: index
    public subscript(i:Int) -> String {
        return self[i ..< i+1]
    }
    
    
    /// cut off some characters on the head of given count.
    ///
    /// - Parameter count: characters count to cut
    /// - Returns: the substring
    public func cutPre(_ count:Int) -> String {
        return self[count ..< self.count]
    }
    
    
    /// cut off some characters in the end of given count.
    ///
    /// - Parameter count: characters count to cut
    /// - Returns: the substring
    public func cutSuf(_ count:Int) -> String {
        return self[0 ..< self.count-count]
    }
    
    
    /// returns if current string has at least one number
    public var hasNumber: Bool {
        return rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
    }
    
    /// returns if current string has at least one letter
    public var hasLetter: Bool {
        return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }
    
    
    /// returns if current string is an email address
    public var isEmailAddress: Bool {
        return range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                     options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    
    /// returns if current string is a valid url address
    public var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    
    
    /// returns if current string is a number.
    public var isNumber: Bool {
        let scanner = Scanner(string: self)
        scanner.locale = NSLocale.current
        return scanner.scanDecimal(nil) && scanner.isAtEnd
    }
    
    /// returns an optional bool value created by current string
    public var bool: Bool? {
        let selfLowercased = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if selfLowercased == "true" || selfLowercased == "1" {
            return true
        } else if selfLowercased == "false" || selfLowercased == "0" {
            return false
        }
        return nil
    }
}
