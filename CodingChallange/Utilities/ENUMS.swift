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

//MARK: - MESSGAGES -
enum Messages: String {
    case apiErrorMessage = "There is something wrong."
    
}

//MARK: - PARAMETERS
enum Parameters: String {
    case page = "page"
}

//MARK: - DATE FORMAT ENUM -
enum DateFormat: String {
    case yyyyMMdd = "yyyy-MM-dd"
}
