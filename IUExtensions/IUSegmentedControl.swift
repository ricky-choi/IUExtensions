//
//  IUSegmentedControl.swift
//  IUExtensions
//
//  Created by Jae Young Choi on 2017. 2. 5..
//  Copyright © 2017년 Appcid. All rights reserved.
//

import Foundation


#if os(iOS)
    import UIKit
    public typealias Control = UIControl
    public typealias ControlState = UIControlState
    public typealias Image = UIImage
    public typealias Button = UIButton
#elseif os(OSX)
    public struct AUIControlState : OptionSet, Hashable {
        let _rawValue: UInt
        
        public var rawValue: UInt {
            return _rawValue
        }
        
        public init(rawValue: UInt) {
            self._rawValue = rawValue
        }
        
        public var hashValue: Int {
            return Int(_rawValue)
        }
        
        public static let normal: AUIControlState = AUIControlState(rawValue: 0)
        
        public static let highlighted: AUIControlState = AUIControlState(rawValue: 0b1) // used when UIControl isHighlighted is set
        
        public static let disabled: AUIControlState = AUIControlState(rawValue: 0b10)
        
        public static let selected: AUIControlState = AUIControlState(rawValue: 0b100) // flag usable by app (see below)
        
        public static let focused: AUIControlState = AUIControlState(rawValue: 0b1000) // Applicable only when the screen supports focus
        
        public static let application: AUIControlState = AUIControlState(rawValue: 0b111111110000000000000000) // additional flags available for application use
        
        public static let reserved: AUIControlState = AUIControlState(rawValue: 0b11111111000000000000000000000000) // flags reserved for internal framework use
        
        
        
        
        static let `default`: AUIControlState = .normal
        
        static let notDefaultStates: [AUIControlState] = [.highlighted, .disabled, .selected, .focused]
        
    }
    
    
    import Cocoa
    public typealias Control = NSControl
    public typealias ControlState = AUIControlState
    public typealias Image = NSImage
    public typealias Button = NSButton
#endif


public var IUSegmentedControlNoSegment: Int {
    return -1
}

public enum IUSegmentedControlItem {
    case title(String)
    case image(String, Image) // String is for accessibility
    case titleAndImage(String, Image)
}

public enum IUSegmentedControlSelectionType {
    case none
    case changeBackground(Image)
    case BottomBar(Color, CGFloat) // CGFloat is for thickness
    case UpperBar(Color, CGFloat)
}

open class IUSegmentedControl: Control {
    fileprivate var items: [IUSegmentedControlItem]
    fileprivate var buttons = [Button]()
    
    public init(items: [IUSegmentedControlItem], target: AnyObject? = nil, action: Selector? = nil) {
        self.items = items
        
        super.init(frame: CGRect.zero)
        
        #if os(OSX)
            self.target = target
            self.action = action
        #endif
        
        readyButtons()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open var selectionType: IUSegmentedControlSelectionType = .none
    
    open var numberOfSegments: Int {
        return items.count
    }
    
    open func setTitle(_ title: String?, forSegmentAt segment: Int) {
        
    }// can only have image or title, not both. must be 0..#segments - 1 (or ignored). default is nil
    
    open func titleForSegment(at segment: Int) -> String? {
        return nil
    }
    
    
    open func setImage(_ image: Image?, forSegmentAt segment: Int) {
        
    }// can only have image or title, not both. must be 0..#segments - 1 (or ignored). default is nil
    
    open func imageForSegment(at segment: Int) -> Image? {
        return nil
    }
    
    
    open func setWidth(_ width: CGFloat, forSegmentAt segment: Int) {
        
    }// set to 0.0 width to autosize. default is 0.0
    
    open func widthForSegment(at segment: Int) -> CGFloat {
        return 0
    }
    
    
    open func setContentOffset(_ offset: CGSize, forSegmentAt segment: Int) {
        
    }// adjust offset of image or text inside the segment. default is (0,0)
    
    open func contentOffsetForSegment(at segment: Int) -> CGSize {
        return CGSize.zero
    }
    
    
    open func setEnabled(_ enabled: Bool, forSegmentAt segment: Int) {
        
    }// default is YES
    
    open func isEnabledForSegment(at segment: Int) -> Bool {
        return true
    }
    
    
    // ignored in momentary mode. returns last segment pressed. default is UISegmentedControlNoSegment until a segment is pressed
    // the UIControlEventValueChanged action is invoked when the segment changes via a user event. set to UISegmentedControlNoSegment to turn off selection
    open var selectedSegmentIndex: Int {
        return IUSegmentedControlNoSegment
    }
    
    open var selectedSegment: Int {
        return selectedSegmentIndex
    }
    
    #if os(OSX)
    // The tintColor is inherited through the superview hierarchy. See UIView for more information.
    open var tintColor: Color? = nil
    #endif
    
}

extension IUSegmentedControl {
    fileprivate func readyButtons() {
        guard numberOfSegments > 0 else {
            return
        }
        
        buttons = items.map({ (item) -> Button in
            let button = Button()
            
            var title: String?
            var accessibilityLabel: String?
            var image: Image?
            
            switch item {
            case .title(let itemTitle):
                title = itemTitle
                accessibilityLabel = itemTitle
            case .image(let itemAccessibilityLabel, let itemImage):
                accessibilityLabel = itemAccessibilityLabel
                image = itemImage
            case .titleAndImage(let itemTitle, let itemImage):
                title = itemTitle
                accessibilityLabel = itemTitle
                image = itemImage
            }
            
            #if os(iOS)
                if let title = title {
                    button.setTitle(title, for: .normal)
                }
                
                if let image = image {
                    button.setImage(image, for: .normal)
                }
                
                button.accessibilityLabel = accessibilityLabel
            #elseif os(OSX)
                
            #endif
            
            
            return button
        })
    }
}
