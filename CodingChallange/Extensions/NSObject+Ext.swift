//
//  NSObject+Ext.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import Foundation
import UIKit

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
