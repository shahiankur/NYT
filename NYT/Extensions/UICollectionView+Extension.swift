//
//  UICollectionView+Extension.swift
//  NYT
//
//

import Foundation
import UIKit

extension UICollectionView {
    
    // MARK: UICollectionViewCell Registration/Dequeuing
    func registerNib<T: UICollectionViewCell>(_ type: T.Type) {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerClass<T: UICollectionViewCell>(_ type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    // MARK: UICollectionReusableView Registration/Dequeing
    func registerHeader<T: UICollectionReusableView>(_ type: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderNib<T: UICollectionReusableView>(_ type: T.Type) {
        register(T.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueHeader<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                withReuseIdentifier: T.reuseIdentifier,
                                                for: indexPath) as! T
    }
}
