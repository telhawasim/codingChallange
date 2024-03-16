//
//  TVSeriesTVCell.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import UIKit

class TVSeriesTVCell: UITableViewCell {
    
    //MARK: - OUTLETS -
    
    //UILabel
    @IBOutlet weak var lblTitle: UILabel!

    //MARK: - LIFECYCLE -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}

//MARK: - FUNCTIONS -
extension TVSeriesTVCell {
    
    //MARK: - CONFIGURE CELL -
    func configureCell(data: Result?) {
        self.lblTitle.text = data?.name
    }
}
