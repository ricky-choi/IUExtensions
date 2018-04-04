//
//  IUELocalizable.swift
//  IUExtensions
//
//  Created by ricky on 2017. 2. 14..
//  Copyright © 2017년 Appcid. All rights reserved.
//

import Foundation

public class IUELocalizable {
    static var languageBundle: Bundle = {
        let frameworkBundle = Bundle(for: IUELocalizable.self)
        guard let resourceBundlePath = frameworkBundle.path(forResource: "IUExtensions", ofType: "bundle"), let resourceBundle = Bundle(path: resourceBundlePath) else {
            return Bundle.main
        }
        
        var currentLocalization = "en"
        if let localization = Bundle.main.preferredLocalizations.first {
            currentLocalization = localization
        }
        
        if let languagePath = resourceBundle.path(forResource: currentLocalization, ofType: "lproj"), let languageBundle = Bundle(path: languagePath) {
            return languageBundle
        } else if let languagePath = resourceBundle.path(forResource: "en", ofType: "lproj"), let languageBundle = Bundle(path: languagePath) {
            return languageBundle
        }
        
        return Bundle.main
    }()
    
    public static func string(for key: String) -> String {
        return languageBundle.localizedString(forKey: key, value: nil, table: "IUELocalizable")
    }
}
