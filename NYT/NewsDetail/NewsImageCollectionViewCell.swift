//
//  NewsImageCollectionViewCell.swift
//  NYT
//
//  Created by Shahi, Ankur EX1 on 24/11/20.
//

import UIKit
import Kingfisher

final class NewsImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var newsImageview: UIImageView!
    
    // MARK: - Configure Cell
    
    func configure(url: String) {
        let imageUrl = URL(string: url)
        newsImageview.kf.setImage(with: imageUrl)
    }
    
    // MARK: - Helper
    
    // Adapted from https://www.robertpieta.com/autosizing-full-width-cells/
    override func systemLayoutSizeFitting(
        _ targetSize: CGSize,
        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
        verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        var targetSize = targetSize
        targetSize.height = CGFloat.greatestFiniteMagnitude
        
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        return size
    }
}
