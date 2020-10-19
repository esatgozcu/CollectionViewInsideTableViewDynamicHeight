//
//  CollectionViewCell.swift
//  tableviewInsideCollectionView
//
//  Created by mac on 10/12/20.
//  Copyright © 2020 Esat Gozcu. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK:- Auto Layout methods
    //
    // Only use horizontal direction
    //
    private static let sizingCell = UINib(nibName: "CollectionViewCell", bundle: nil).instantiate(withOwner: nil, options: nil).first! as! CollectionViewCell
    public static func height(width: CGFloat) -> CGFloat {
        sizingCell.prepareForReuse()
        sizingCell.layoutIfNeeded()
        var fittingSize = UIView.layoutFittingCompressedSize
        fittingSize.width = width
        let size = sizingCell.contentView.systemLayoutSizeFitting(fittingSize,
                                                                  withHorizontalFittingPriority: .required,
                                                                  verticalFittingPriority: .defaultLow)
        return size.height
    }
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    //MARK: END
}
