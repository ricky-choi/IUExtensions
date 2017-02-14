//
//  CellExtension.swift
//  
//
//  Created by Jaeyoung Choi on 2016. 1. 27..
//  Copyright © 2016년 Appcid. All rights reserved.
//

import Foundation

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static public var reuseIdentifier: String {
        return String(describing: self)
    }
}

public protocol Dequeable: class {
    func registerCell<T: Reusable>(_ cellClass: T.Type)
    func dequeueCell<T: Reusable>(_ indexPath: IndexPath) -> T
}

#if os(iOS)
    
import UIKit

extension Dequeable where Self: UITableView {
    public func registerCell<T: Reusable>(_ cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueCell<T: Reusable>(_ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}

extension Dequeable where Self: UICollectionView {
    public func registerCell<T: Reusable>(_ cellClass: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func registerSupplementary<T: Reusable>(_ cellClass: T.Type, kind: String) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueCell<T: Reusable>(_ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    public func dequeueSupplementary<T: Reusable>(_ kind: String, indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}

extension UITableViewCell: Reusable {}
extension UICollectionReusableView: Reusable {}

extension UITableView: Dequeable {}
extension UICollectionView: Dequeable {}

#endif
