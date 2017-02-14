//
//  ScrollViewExtension.swift
//  
//
//  Created by Jaeyoung Choi on 2015. 12. 2..
//  Copyright © 2015년 Appcid. All rights reserved.
//

#if os(iOS)
    
import UIKit

extension UIScrollView {
    public func setInset(_ inset: UIEdgeInsets) {
        contentInset = inset
        scrollIndicatorInsets = inset
    }
    
    public func scrollToTop(_ animated: Bool = true) {
        scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: animated)
    }
    
    public func isTop() -> Bool {
        return contentOffset.y + contentInset.top <= 0
    }
}

#endif
