//
//  NewsDetailCollectionViewCell.swift
//  NYT
//
//  Created by Shahi, Ankur EX1 on 24/11/20.
//

import UIKit

final class NewsDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var detailItemLabel: UILabel!
    
    // MARK: - Connfigure Cells
    
    func configure(viewModel: Article, row: Int) {
        if row == 0 {
            detailItemLabel.attributedText =  prepareAttributedText(heading: "Title : ", description: viewModel.name)
        }
        else if row == 1 { detailItemLabel.attributedText = prepareAttributedText(heading: "Updated Date : ", description: (viewModel.updatedDate ?? "NA")) }
        else if row == 2 { detailItemLabel.attributedText = prepareAttributedText(heading: "", description:  (viewModel.byLineString ?? "NA")) }
        else if row == 3 { detailItemLabel.attributedText = prepareAttributedText(heading: "Abstract Info: ", description:  (viewModel.abstractInfo ?? "NA")) }
        else if row == 4 { detailItemLabel.attributedText = prepareAttributedText(heading: "Source : ", description:  (viewModel.source ?? "NA")) }
        else if row == 5 { detailItemLabel.attributedText = prepareAttributedText(heading: "Updated Date : ", description:  (viewModel.updatedDate ?? "NA")) }
        else if row == 6 { detailItemLabel.attributedText = prepareAttributedText(heading: "Type : ", description: (viewModel.type ?? "NA")) }
        else if row == 7 { detailItemLabel.attributedText = prepareAttributedText(heading: "Caption : ", description: (viewModel.caption ?? "NA")) }
    }
    
    // MARK: - Helpers
    
    private func prepareAttributedText(heading: String, description: String) -> NSMutableAttributedString{
        let boldAttribute = [ NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 15.0)! ]
        let regularAttribute = [ NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 13.0)! ]
        let boldText = NSMutableAttributedString(string: heading, attributes: boldAttribute)
        let regularText = NSMutableAttributedString(string: description, attributes: regularAttribute)
        let finalString = NSMutableAttributedString()
        finalString.append(boldText)
        finalString.append(regularText)
        return finalString
    }
    
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
