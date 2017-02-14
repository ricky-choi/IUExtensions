//
//  JSON.swift
//  AppcidCocoaUtil
//
//  Created by ricky on 2017. 2. 10..
//  Copyright © 2017년 Appcid. All rights reserved.
//

import Foundation

func beautifyJson(value: Any) -> String? {
    if JSONSerialization.isValidJSONObject(value) {
        if let data = try? JSONSerialization.data(withJSONObject: value, options: JSONSerialization.WritingOptions.prettyPrinted) {
            if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                return string as String
            }
        }
    }
    return nil
}
