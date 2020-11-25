//
//  NewsListCollectionViewCell.swift
//  NYT
//
//

import UIKit
import Kingfisher

final class NewsListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleBy: UILabel!
    
    // MARK: - Configure Cells
    
    func configure(viewModel: Article) {
        let boldAttribute = [ NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 15.0)! ]
        let regularAttribute = [ NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 13.0)! ]
        let imageUrl = URL(string: viewModel.imageUrl!)
        articleImageView.kf.setImage(with: imageUrl)
        articleTitle.attributedText = NSAttributedString(string: viewModel.name, attributes: boldAttribute)
        articleDate.attributedText = NSAttributedString(string: viewModel.updatedDate ?? "NA", attributes: regularAttribute)
        articleBy.attributedText = NSAttributedString(string: viewModel.byLineString ?? "NA", attributes: regularAttribute)
        articleImageView.layer.cornerRadius = articleImageView.bounds.size.width / 2
        articleImageView.layer.masksToBounds = true
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
