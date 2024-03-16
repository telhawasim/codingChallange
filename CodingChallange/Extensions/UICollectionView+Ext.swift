//
//  UICollectionView+Ext.swift
//  CodingChallange
//
//  Created by Telha Wasim on 16/03/2024.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(name: T.Type) {
        let nibName = String(describing: name)
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: nibName)
    }
}
