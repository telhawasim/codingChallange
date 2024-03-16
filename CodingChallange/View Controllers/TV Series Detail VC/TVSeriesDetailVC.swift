//
//  TVSeriesDetailVC.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import UIKit

class TVSeriesDetailVC: UIViewController {
    
    //MARK: - OUTLETS -
    
    //UICollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    //UITableView
    @IBOutlet weak var tableView: UITableView!
    //UIActivityIndicatorView
    @IBOutlet weak var loader: UIActivityIndicatorView!
    //UILabel
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFirstAiredYear: UILabel!
    @IBOutlet weak var lblTotalSeasons: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    //UIImageView
    @IBOutlet weak var imgProfile: UIImageView!
    //NSLayoutConstraint
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    //MARK: - VARIABLES -
    var id: Int?
    var selectedIndex: Int? = 0 {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var model: TVSeriesDetailResponse? {
        didSet {
            self.collectionView.reloadData()
            self.setData()
        }
    }
    var episodes: EpisodeListingResponse? {
        didSet {
            self.setTableViewHeight()
            self.tableView.reloadData()
        }
    }
    
    //MARK: - LIFECYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.configureTableView()
        self.getTVSerialDetail()
    }
    
    //MARK: - BUTTON BACK TAPPED -
    @IBAction func btnBackTapped(_ sender: Any) {
        Routing.shared.popViewController(from: self)
    }
    
    //MARK: - BUTTON PLAY TAPPED -
    @IBAction func btnPlayTapped(_ sender: Any) {
        Utilities.shared.playVideo(from: ApiUrls.VIDEO_URL, in: self)
    }
}

//MARK: - FUNCTIONS -
extension TVSeriesDetailVC {

    //MARK: - CONFIGURE COLLECTION VIEW -
    private func configureCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCell(name: SeasonCVCell.self)
    }
    
    //MARK: - CONFIGURE TABLE VIEW -
    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCell(name: EpisodeTVCell.self)
    }
    
    //MARK: - SET DATA -
    private func setData() {
        self.lblName.text = self.model?.name
        self.lblFirstAiredYear.text = Utilities.shared.getYearFromDate(date: self.model?.firstAirDate ?? "")
        self.lblTotalSeasons.text = "\((self.model?.seasons?.count ?? 0) - 1)" + " " + Constants.seasons
        self.lblGenre.text = self.model?.genres?[0].name ?? ""
        self.lblOverview.text = self.model?.overview
        self.setProfileImage(image: self.model?.posterPath ?? "")
    }
    
    //MARK: - SET PROFILE IMAGE -
    private func setProfileImage(image: String) {
        Utilities.shared.loadImageFromURL(image: image) { image in
            self.imgProfile.image = image
        }
    }
    
    //MARK: - SET TABLE VIEW HEIGHT -
    private func setTableViewHeight() {
        self.tableViewHeight.constant = CGFloat((self.episodes?.episodes?.count ?? 0) * 131)
    }
}

//MARK: - COLLECTION VIEW DELEGATE METHODS -
extension TVSeriesDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model?.seasons?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeasonCVCell.identifier, for: indexPath) as! SeasonCVCell
        cell.configureCell(index: indexPath.row)
        cell.setSelected(indexPath.row == self.selectedIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.getEpisodesListingAPI()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160.0, height: 50.0)
    }
}

//MARK: - TABLE VIEW DELEGATE METHODS -
extension TVSeriesDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodes?.episodes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTVCell.identifier, for: indexPath) as! EpisodeTVCell
        cell.configureCell(data: self.episodes?.episodes?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Routing.shared.navigateToEpisodeDetail(from: self, seriesID: self.id ?? 0, seasonNumber: self.selectedIndex ?? 0, episodeNumber: indexPath.row + 1)
    }
}

//MARK: - API CALLING -
extension TVSeriesDetailVC {
    
    //MARK: - GET TV SERIAL LIST -
    func getTVSerialDetail() {
        DispatchQueue.main.async {
            let endPoint = ApiUrls.SERIES_DETAIL + "\(self.id ?? 0)"
            Loader.shared.showLoader(loader: self.loader, currentView: self.view)
            NetworkManager.shared.request(endPoint: endPoint, method: .get) { (data: TVSeriesDetailResponse?) in
                Loader.shared.hideLoader(loader: self.loader, currentView: self.view)
                if let data = data {
                    self.model = data
                    self.getEpisodesListingAPI()
                } else {
                    Utilities.shared.showAlert(on: self, with: Messages.apiErrorMessage.rawValue)
                }
            }
        }
    }
    
    //MARK: - GET EPIDODE LISTING AGAINST EACH SEASON -
    func getEpisodesListingAPI() {
        DispatchQueue.main.async {
            let endPoint = ApiUrls.SERIES_DETAIL + "\(self.id ?? 0)" + "/season/" + "\(self.selectedIndex ?? 0)"
            Loader.shared.showLoader(loader: self.loader, currentView: self.view)
            NetworkManager.shared.request(endPoint: endPoint, method: .get) { (data: EpisodeListingResponse?) in
                Loader.shared.hideLoader(loader: self.loader, currentView: self.view)
                if let data = data {
                    self.episodes = data
                } else {
                    Utilities.shared.showAlert(on: self, with: Messages.apiErrorMessage.rawValue)
                }
            }
        }
    }
}
