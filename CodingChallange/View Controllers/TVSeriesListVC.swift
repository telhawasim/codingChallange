//
//  TVSeriesListVC.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import UIKit

class TVSeriesListVC: UIViewController {
    
    //MARK: - OUTLETS -
    
    //UILabel
    @IBOutlet weak var lblTitle: UILabel!
    
    //MARK: - VARIABLES
    var index: Int?

    //MARK: - LIFECYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle()
    }
    
    //MARK: - BUTTON BACK TAPPED -
    @IBAction func btnBackTapped(_ sender: Any) {
        Routing.shared.popViewController(from: self)
    }
}

//MARK: - FUNCTIONS -
extension TVSeriesListVC {
    
    //MARK: - SET TITLE -
    private func setTitle() {
        guard let index = index else { return }
        
        switch index {
        case 0:
            self.lblTitle.text = Constants.airingToday
        case 1:
            self.lblTitle.text = Constants.onTheAir
        case 2:
            self.lblTitle.text = Constants.popular
        case 3:
            self.lblTitle.text = Constants.topRated
        default:
            return
        }
    }
}
