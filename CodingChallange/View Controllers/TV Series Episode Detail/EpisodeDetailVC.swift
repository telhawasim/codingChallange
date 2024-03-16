//
//  EpisodeDetailVC.swift
//  CodingChallange
//
//  Created by Telha Wasim on 16/03/2024.
//

import UIKit

class EpisodeDetailVC: UIViewController {
    
    //MARK: - OUTLETS -
    
    //UIImageView
    @IBOutlet weak var imgEpisode: UIImageView!
    //UILabel
    @IBOutlet weak var lblEpisodeName: UILabel!
    @IBOutlet weak var lblRuntime: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    //UIActivityIndicatorView
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    //MARK: - VARIABLES -
    var seriesID: Int?
    var seasonNumber: Int?
    var episodeNumber: Int?
    var model: EpisodeDetailResponse? {
        didSet {
            self.setData()
        }
    }
    
    //MARK: - LIFECYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getEpisodesDetailAPI()
    }
    
    //MARK: - BUTTON BACK TAPPED -
    @IBAction func btnBackTapped(_ sender: Any) {
        Routing.shared.popViewController(from: self)
    }
}

//MARK: - FUNCTIONS -
extension EpisodeDetailVC {
    
    //MARK: - SET DATA -
    private func setData() {
        self.lblEpisodeName.text = self.model?.name
        self.lblRuntime.text = "\(self.model?.runtime ?? 0)" + " " + Constants.min
        self.lblOverview.text = self.model?.overview
        self.setProfileImage(image: self.model?.stillPath ?? "")
    }
    
    //MARK: - SET PROFILE IMAGE -
    private func setProfileImage(image: String) {
        Utilities.shared.loadImageFromURL(image: image) { image in
            self.imgEpisode.image = image
        }
    }
}

//MARK: - API CALLING -
extension EpisodeDetailVC {
    
    //MARK: - GET EPIDODE LISTING AGAINST EACH SEASON -
    func getEpisodesDetailAPI() {
        DispatchQueue.main.async {
            let endPoint = ApiUrls.SERIES_DETAIL + "\(self.seriesID ?? 0)" + "/season/" + "\(self.seasonNumber ?? 0)" + "/episode/" + "\(self.episodeNumber ?? 0)"
            Loader.shared.showLoader(loader: self.loader, currentView: self.view)
            NetworkManager.shared.request(endPoint: endPoint, method: .get) { (data: EpisodeDetailResponse?) in
                Loader.shared.hideLoader(loader: self.loader, currentView: self.view)
                if let data = data {
                    self.model = data
                } else {
                    Utilities.shared.showAlert(on: self, with: Messages.apiErrorMessage.rawValue)
                }
            }
        }
    }
}
