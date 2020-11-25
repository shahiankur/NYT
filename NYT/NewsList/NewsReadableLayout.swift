//
//  NewsReadableLayout.swift
//  NYT
//
//

import Foundation
import UIKit

final class NewsReadableLayout: UICollectionViewFlowLayout {
    
    private enum Constants {
        static let ipadWidth: CGFloat = 656
        static let ipadSectionInsets: UIEdgeInsets = .init(top: 16,
                                                           left: 56,
                                                           bottom: 16,
                                                           right: 56)
        static let sectionInsets: UIEdgeInsets = .init(top: 16,
                                                       left: 8,
                                                       bottom: 16,
                                                       right: 8)
        static let estimatedCellHeight: CGFloat = 120
    }
    
    private func cellWidth(for bounds: CGRect) -> CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        
        let readableInsets = collectionView.directionalLayoutMargins
        let width = bounds.width - readableInsets.leading - readableInsets.trailing - sectionInset.left - sectionInset.right
        
        return UIDevice.current.userInterfaceIdiom == .pad  ? Constants.ipadWidth : max(width, 0)
    }
    
    private func updateEstimatedSize(bounds: CGRect) {
        estimatedItemSize = CGSize(width: cellWidth(for: bounds),
                                   height: Constants.estimatedCellHeight)
        sectionInset = readableSectionInsets
    }
    
    override func prepare() {
        super.prepare()
        
        let bounds = collectionView?.bounds ?? .zero
        updateEstimatedSize(bounds: bounds)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else {
            return false
        }
        
        let oldSize = collectionView.bounds.size
        guard oldSize != newBounds.size else { return false }
        
        updateEstimatedSize(bounds: newBounds)
        return true
    }
    
    private var readableSectionInsets: UIEdgeInsets {
        return UIDevice.current.userInterfaceIdiom == .pad ? Constants.ipadSectionInsets : Constants.sectionInsets
    }
}

