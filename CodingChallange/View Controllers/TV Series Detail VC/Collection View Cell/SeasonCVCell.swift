//
//  SeasonCVCell.swift
//  CodingChallange
//
//  Created by Telha Wasim on 16/03/2024.
//

import UIKit

class SeasonCVCell: UICollectionViewCell {
    
    //MARK: - OUTLETS -
    
    //UILabel
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var divider: UILabel!
    //UIView
    @IBOutlet weak var selector: UIView!

    //MARK: - LIFECYCLE -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

//MARK: - FUNCTIONS -
extension SeasonCVCell {
    
    //MARK: - CONFIGURE CELL -
    func configureCell(index: Int) {
        if index == 0 {
            self.lblTitle.text = Constants.specials
        } else {
            self.lblTitle.text = Constants.season + " " + "\(index)"
        }
    }
    
    //MARK: - SET SELECTED -
    func setSelected(_ isSelected: Bool) {
        self.selector.isHidden = isSelected ? false : true
        self.lblTitle.textColor = isSelected ? .white : .lightGray
        self.lblTitle.font = isSelected ? UIFont.systemFont(ofSize: 17.0, weight: .bold) : UIFont.systemFont(ofSize: 17.0, weight: .regular)
    }
}
