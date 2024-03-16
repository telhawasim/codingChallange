//
//  EpisodeTVCell.swift
//  CodingChallange
//
//  Created by Telha Wasim on 16/03/2024.
//

import UIKit

class EpisodeTVCell: UITableViewCell {
    
    //MARK: - OUTLETS -

    //UILabel
    @IBOutlet weak var lblTitle: UILabel!
    //UIImageView
    @IBOutlet weak var imgEpisode: UIImageView!
    
    //MARK: - LIFECYCLE -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}

//MARK: - FUNCTIONS -
extension EpisodeTVCell {
    
    //MARK: - CONFIGURE CELL -
    func configureCell(data: Episode?) {
        self.lblTitle.text = data?.name ?? ""
        self.setImage(image: data?.stillPath ?? "")
    }
    
    //MARK: - SET IMAGE -
    private func setImage(image: String) {
        Utilities.shared.loadImageFromURL(image: image) { image in
            self.imgEpisode.image = image
        }
    }
}
