//
//  ViewControllerExtension.swift
//  ACD
//
//  Created by Jaeyoung Choi on 2016. 1. 20..
//  Copyright © 2016년 Appcid. All rights reserved.
//

#if os(iOS)
    
import UIKit

extension UIViewController {
    public func readyScrollView() -> (scrollView: UIScrollView, contentView: UIView) {
        let scrollView = UIScrollView()
        let contentView = UIView()
        
        view.addSubview(scrollView)
        scrollView.fillToSuperview()
        
        scrollView.addSubview(contentView)
        contentView.fillToSuperview()
        
        NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        contentView.backgroundColor = UIColor.white
        
        return (scrollView, contentView)
    }
}

#endif
