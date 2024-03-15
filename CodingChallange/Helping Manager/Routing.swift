//
//  Routing.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import Foundation
import UIKit

class Routing {
    
    static let shared = Routing()
    private init() {
        
    }
    
    //MARK: - POP VIEW CONTROLLER -
    func popViewController(from viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - NAVIGATE TO LIST OF SERIES VIEW CONTROLLER =
    func navigateToListOfSeriesVC(from viewController: UIViewController, index: Int) {
        let vc = StoryboardEnum.main.getStoryboard?.instantiateViewController(withIdentifier: TVSeriesListVC.identifier) as! TVSeriesListVC
        vc.index = index
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
