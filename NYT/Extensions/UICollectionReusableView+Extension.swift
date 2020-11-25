//
//  UICollectionReusableView+Extension.swift
//  NYT
//
//

import Foundation
import UIKit

extension UICollectionReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}
