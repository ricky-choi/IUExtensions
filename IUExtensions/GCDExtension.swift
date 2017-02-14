//
//  GCDExtension.swift
//  AppcidCocoaUtil
//
//  Created by Jae Young Choi on 2016. 12. 30..
//  Copyright © 2016년 Appcid. All rights reserved.
//

import Foundation

public func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
