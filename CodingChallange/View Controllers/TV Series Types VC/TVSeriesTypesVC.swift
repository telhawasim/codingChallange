//
//  TVSeriesTypesVC.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import UIKit

class TVSeriesTypesVC: UIViewController {

    //MARK: - LIFECYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - BUTTON TAPPED -
    @IBAction func btnTapped(_ sender: UIButton) {
        Routing.shared.navigateToListOfSeriesVC(from: self, index: sender.tag)
    }
}
