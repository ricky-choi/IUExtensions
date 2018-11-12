//
//  AlertExtension.swift
//  
//
//  Created by Jaeyoung Choi on 2015. 10. 19..
//  Copyright © 2015년 Appcid. All rights reserved.
//

#if os(iOS)
    
import UIKit

extension UIAlertController {
    public convenience init(title: String, message: String? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
    }
}

extension UIViewController {
    public func showSimpleMessage(title: String, message: String? = nil, actionHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message)
        alert.addAction(UIAlertAction(title: IUELocalizable.string(for: "Dismiss"), style: .default, handler: actionHandler))
        
        #if DEBUG
            if let message = message {
                print("[\(title)] \(message)")
            } else {
                print("[\(title)]")
            }
        #endif
        
        present(alert, animated: true, completion: nil)
    }
    
    public func showSimpleDebugMessage(title: String, message: String? = nil, actionHandler: ((UIAlertAction) -> Void)? = nil) {
        #if DEBUG
            showSimpleMessage(title: title, message: message, actionHandler: actionHandler)
        #endif
    }

    public func showErrorMessage(_ message: String?, actionHandler: ((UIAlertAction) -> Void)? = nil) {
        showSimpleMessage(title: IUELocalizable.string(for: "Error"), message: message, actionHandler: actionHandler)
    }
    
    public func showSimpleMessageWithCancel(title: String, message: String? = nil, actionHandler: ((UIAlertAction) -> Void)? = nil, cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message)
        alert.addAction(UIAlertAction(title: IUELocalizable.string(for: "OK"), style: .default, handler: actionHandler))
        alert.addAction(UIAlertAction(title: IUELocalizable.string(for: "Cancel"), style: .cancel, handler: cancelHandler))
        
        present(alert, animated: true, completion: nil)
    }
    
    public func showPrivacyAlertMessage(title: String, message: String? = nil, cancelTitle: String? = IUELocalizable.string(for: "OK"), actionHandler: ((URL) -> Void)? = nil, cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message)
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        alert.addAction(UIAlertAction(title: IUELocalizable.string(for: "Settings"), style: .default, handler: { _ in
            // go to setting
            let settingsURL = URL(string: UIApplication.openSettingsURLString)!
            actionHandler?(settingsURL)
        }))
        
        present(alert, animated: true, completion: nil)
    }
}

#endif
