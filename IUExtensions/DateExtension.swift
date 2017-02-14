//
//  DateExtension.swift
//  
//
//  Created by Jaeyoung Choi on 2015. 12. 7..
//  Copyright © 2015년 Appcid. All rights reserved.
//

import Foundation

extension Date {
    
    static public func durationString(_ duration: TimeInterval) -> String {
        struct DateFormatter {
            static let formatter: DateComponentsFormatter = {
                let formatter = DateComponentsFormatter()
                formatter.unitsStyle = .positional
                formatter.allowedUnits = [.minute, .second]
                formatter.zeroFormattingBehavior = .pad
                return formatter
            }()
        }
        return DateFormatter.formatter.string(from: duration) ?? "0:00"
    }
   
}
