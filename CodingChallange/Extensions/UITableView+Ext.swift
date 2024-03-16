//
//  UITableView+Ext.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(name: T.Type) {
        let nibName = String(describing: name)
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: nibName)
    }
}
