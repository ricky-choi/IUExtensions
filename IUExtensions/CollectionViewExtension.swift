//
//  CollectionViewExtension.swift
//  
//
//  Created by Jaeyoung Choi on 2015. 12. 23..
//  Copyright © 2015년 Appcid. All rights reserved.
//

#if os(iOS)
    
import UIKit

extension UICollectionView {
    public func indexPathsForElementInRect(_ rect: CGRect) -> [IndexPath]? {
        guard let allLayoutAttributes = collectionViewLayout.layoutAttributesForElements(in: rect) , allLayoutAttributes.count > 0 else {
            return nil
        }
        
        var indexPaths = [IndexPath]()
        for layoutAttributes in allLayoutAttributes {
            indexPaths.append(layoutAttributes.indexPath)
        }
        
        return indexPaths
    }
    
    public func deselectAll(animated: Bool = false) {
        guard let selectedItems = indexPathsForSelectedItems else {
            return
        }
        
        for selectedItem in selectedItems {
            deselectItem(at: selectedItem, animated: animated)
        }
    }
}

#endif
