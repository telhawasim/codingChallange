//
//  Loader.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import Foundation
import UIKit

class Loader {

    static let shared = Loader()

    func showLoader(loader: UIActivityIndicatorView, currentView: UIView) {
        loader.isHidden = false
        loader.startAnimating()
        currentView.isUserInteractionEnabled = false
    }
    
    func hideLoader(loader: UIActivityIndicatorView, currentView: UIView) {
        loader.isHidden = true
        loader.stopAnimating()
        currentView.isUserInteractionEnabled = true
    }
}
