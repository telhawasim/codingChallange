//
//  ENUMS.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import Foundation
import UIKit

//MARK: - STORYBOARD ENUM -
enum StoryboardEnum: String {
    case main = "Main"
    
    var getStoryboard: UIStoryboard? {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}
