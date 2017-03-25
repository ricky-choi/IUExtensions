//
//  StringExtension.swift
//  
//
//  Created by Jaeyoung Choi on 2015. 10. 20..
//  Copyright © 2015년 Appcid. All rights reserved.
//

import Foundation

extension String {
    public func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public func length() -> Int {
        var count = 0
        
        enumerateSubstrings(in: startIndex ..< endIndex, options: .byComposedCharacterSequences) { _ in
            count = count + 1
        }
        
        return count
    }
    
    public func filter(predicate: (Character) -> Bool) -> String {
        var res = String()
        for c in self.characters {
            if (predicate(c)) {
                res.append(c)
            }
        }
        return res
    }
    
    public func trimInside() -> String {
        let trimString = self.trim()
        return trimString.filter { return $0 != Character(" ") }
    }
    
    public func uppercasedFirstCharacterOnly() -> String {
        guard length() > 1 else {
            return uppercased()
        }
        
        let secondIndex = index(after: startIndex)
        
        return substring(to: secondIndex).uppercased() + substring(from: secondIndex)
    }
}

extension NSAttributedString {
    public func addingAttribute(_ name: String, value: Any, range: NSRange) -> NSAttributedString {
        let mutable = mutableCopy() as! NSMutableAttributedString
        mutable.addAttribute(name, value: value, range: range)
        return mutable.copy() as! NSAttributedString
    }
    
    public func addingAttributes(_ attrs: [String : Any], range: NSRange) -> NSAttributedString {
        let mutable = mutableCopy() as! NSMutableAttributedString
        mutable.addAttributes(attrs, range: range)
        return mutable.copy() as! NSAttributedString
    }
}
