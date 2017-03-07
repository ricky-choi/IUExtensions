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
#elseif os(OSX)
    import Cocoa
#endif


public var IUSegmentedControlNoSegment: Int {
    return -1
}

public enum IUSegmentedControlSelectionType {
    case none
    case changeBackground(Image)
    case BottomBar(Color, CGFloat) // CGFloat is for thickness
    case UpperBar(Color, CGFloat)
}

open class IUSegmentedControl: Control {
    fileprivate var buttons: [IUButton]
    
    convenience public init(items: [IUButtonItem], target: AnyObject? = nil, action: Selector? = nil) {
        let buttons = IUSegmentedControl.readyButtons(items)
        
        self.init(buttons: buttons, target: target, action: action)
    }
    
    public init(buttons: [IUButton], target: AnyObject? = nil, action: Selector? = nil) {
        self.buttons = buttons
        
        super.init(frame: CGRect.zero)
        
        #if os(OSX)
            self.target = target
            self.action = action
        #endif
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open var selectionType: IUSegmentedControlSelectionType = .none
    
    open var numberOfSegments: Int {
        return buttons.count
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
    static fileprivate func readyButtons(_ items: [IUButtonItem]) -> [IUButton] {
        guard items.count > 0 else {
            return []
        }
        
        return items.map{ IUButton(item: $0) }
    }
}
