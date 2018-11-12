//
//  DocumentExtension.swift
//  Appetizer
//
//  Created by Jaeyoung Choi on 2016. 10. 26..
//  Copyright © 2016년 Appcid. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
    
    extension UIDocument.State: CustomStringConvertible {
        public var description: String {
            var statusString = ""
            
            if contains(.normal) {
                statusString = "normal"
            }
            if contains(.closed) {
                if !statusString.isEmpty {
                    statusString += "|"
                }
                statusString += "closed"
            }
            if contains(.inConflict) {
                if !statusString.isEmpty {
                    statusString += "|"
                }
                statusString += "inConflict"
            }
            if contains(.savingError) {
                if !statusString.isEmpty {
                    statusString += "|"
                }
                statusString += "savingError"
            }
            if contains(.editingDisabled) {
                if !statusString.isEmpty {
                    statusString += "|"
                }
                statusString += "editingDisabled"
            }
            
            return statusString
        }
    }
    
#endif

