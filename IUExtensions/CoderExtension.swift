//
//  CoderExtension.swift
//  Appetizer
//
//  Created by Jaeyoung Choi on 2016. 10. 26..
//  Copyright © 2016년 Appcid. All rights reserved.
//

import Foundation

#if os(OSX)
    extension NSCoder {
        public func decodeCGSize(forKey key: String) -> CGSize {
            return decodeSize(forKey: key) as CGSize
        }
        
        public func decodeCGRect(forKey key: String) -> CGRect {
            return decodeRect(forKey: key) as CGRect
        }
        
        public func decodeCGPoint(forKey key: String) -> CGPoint {
            return decodePoint(forKey: key) as CGPoint
        }
    }
#endif
