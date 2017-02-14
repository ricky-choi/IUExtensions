//
//  ImageViewExtension.swift
//  PhotoGPS
//
//  Created by Jaeyoung Choi on 2016. 6. 13..
//  Copyright © 2016년 Appcid. All rights reserved.
//

#if os(iOS)

import UIKit

public class ScaleImageView: UIImageView {
    public init(image: UIImage?, highlightedImage: UIImage? = nil, scale: CGFloat = 1.0) {
        self.scale = scale
        
        super.init(image: image, highlightedImage: highlightedImage)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let scale: CGFloat
    
    override public var intrinsicContentSize : CGSize {
        let size = super.intrinsicContentSize
        
        return size * scale
    }
}

#endif
