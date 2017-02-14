//
//  FoundationExtension.swift
//  
//
//  Created by Jaeyoung Choi on 2015. 11. 24..
//  Copyright © 2015년 Appcid. All rights reserved.
//

import Foundation
import CoreGraphics

#if os(iOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

extension Collection where Self.Iterator.Element == IndexPath {
    #if os(iOS) || os(watchOS)
    public func rows() -> [Int] {
        return self.map({ (indexPath: IndexPath) -> Int in
            return indexPath.row
    })
    }
    #elseif os(OSX)
    public func items() -> [Int] {
        return self.map({ (indexPath: IndexPath) -> Int in
            return indexPath.item
        })
    }
    #endif
}

extension Bool {
    public func localizedDescription() -> String {
        if self {
            return NSLocalizedString("On", comment: "On")
        } else {
            return NSLocalizedString("Off", comment: "Off")
        }
    }
}

extension CGFloat {
    public var int: Int {
        return Int(self)
    }
    
    public var uint: UInt {
        return UInt(self)
    }
    
    public func max(_ maxValue: CGFloat) -> CGFloat {
        return self <= maxValue ? self : maxValue
    }
}

extension Int {
    public var number: NSNumber {
        return NSNumber(value: self)
    }
}

enum SizeIdiom {
    case width
    case height
}

extension CGSize {
    public var ratio: CGFloat {
        return height / width
    }
    
    public func sizeForSampleSize(_ size: CGSize) -> CGSize {
        let sizeIdiom: SizeIdiom
        if self.width >= self.height {
            sizeIdiom = .width
        } else {
            sizeIdiom = .height
        }
        
        let scale: CGFloat
        switch sizeIdiom {
        case .width:
            scale = size.width / self.width
        case .height:
            scale = size.height / self.height
        }
        
        return self * scale
    }
}

// CGPoint
public func +=(lhs: inout CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func -=(lhs: inout CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

// CGSize
public func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

public func *= (lhs: inout CGSize, rhs: CGFloat) {
    lhs = CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

public func > (lhs: CGSize, rhs: CGSize) -> Bool {
    return (lhs.width > rhs.width) && (lhs.height > rhs.height)
}

