//
//  IUButton.swift
//  IUExtensions
//
//  Created by ricky on 2017. 3. 8..
//  Copyright © 2017년 Appcid. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
    public typealias Image = UIImage
    public typealias Button = UIButton
#elseif os(OSX)
    import Cocoa
    public typealias Image = NSImage
    public typealias Button = NSButton
#endif

public enum IUButtonImagePosition {
    case imageLeft(padding: CGFloat)
    case imageRight(padding: CGFloat)
    case imageBelow(padding: CGFloat)
    case imageAbove(padding: CGFloat)
    case imageLeading(padding: CGFloat)
    case imageTrailing(padding: CGFloat)
}

public enum IUButtonItem {
    case title(String)
    case image(Image)
    case titleAndImage(String, Image, IUButtonImagePosition)
    
    var title: String {
        switch self {
        case .title(let string):
            return string
        case .image(_):
            return ""
        case .titleAndImage(let string, _, _):
            return string
        }
    }
}

open class IUButton: Button {
    static let defaultPadding: CGFloat = 10
    
    open var buttonImagePosition: IUButtonImagePosition = .imageLeading(padding: IUButton.defaultPadding)
    
    open var buttonItem: IUButtonItem
    
    init(item: IUButtonItem) {
        buttonItem = item
        
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
