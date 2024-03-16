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
    //UITableView
    @IBOutlet weak var tableView: UITableView!
    //UIActivityIndicatorView
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    //MARK: - VARIABLES
    var index: Int?
    var currentPage: Int = 1
    var lastPage: Int = -1
    var model: TVSeriesListResponse? {
        didSet {
            self.tableView.reloadData()
        }
    }

    //MARK: - LIFECYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.apiCall()
    }
    
    //MARK: - BUTTON BACK TAPPED -
    @IBAction func btnBackTapped(_ sender: Any) {
        Routing.shared.popViewController(from: self)
    }
}

//MARK: - FUNCTIONS -
extension TVSeriesListVC {
    
    //MARK: - CONFIGURE TABLE VIEW -
    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCell(name: TVSeriesTVCell.self)
    }
    
    //MARK: - SET TITLE -
    private func apiCall() {
        guard let index = index else { return }
        
        switch index {
        case 0:
            self.lblTitle.text = Constants.airingToday
            self.getTVSerialList(endPoint: ApiUrls.AIRING_TODAY, page: self.currentPage)
        case 1:
            self.lblTitle.text = Constants.onTheAir
            self.getTVSerialList(endPoint: ApiUrls.ON_THE_AIR, page: self.currentPage)
        case 2:
            self.lblTitle.text = Constants.popular
            self.getTVSerialList(endPoint: ApiUrls.POPULAR, page: self.currentPage)
        case 3:
            self.lblTitle.text = Constants.topRated
            self.getTVSerialList(endPoint: ApiUrls.TOP_RATED, page: self.currentPage)
        default:
            return
        }
    }
    
    //MARK: - GET PARAMS
    private func getParams() -> [String: Any] {
        var params: [String: Any] = [:]
        
        params[Parameters.page.rawValue] = self.currentPage
        return params
    }
}

//MARK: - TABLEVIEW DELEGATE METHODS -
extension TVSeriesListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TVSeriesTVCell.identifier, for: indexPath) as! TVSeriesTVCell
        cell.configureCell(data: self.model?.results?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Routing.shared.navigateToSeriesDetailVC(from: self, id: self.model?.results?[indexPath.row].id)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (self.model?.results?.count ?? 0) - 1 && self.currentPage < self.lastPage {
            self.currentPage = self.currentPage + 1
            self.apiCall()
        }
    }
}

//MARK: - API CALLING -
extension TVSeriesListVC {
    
    //MARK: - GET TV SERIAL LIST -
    func getTVSerialList(endPoint: String, page: Int) {
        DispatchQueue.main.async {
            Loader.shared.showLoader(loader: self.loader, currentView: self.view)
            NetworkManager.shared.request(endPoint: endPoint, method: .get, parameters: self.getParams()) { (data: TVSeriesListResponse?) in
                Loader.shared.hideLoader(loader: self.loader, currentView: self.view)
                if let data = data {
                    self.currentPage = data.page ?? 0
                    self.lastPage = data.totalPages ?? 0
                    if self.model == nil {
                        self.model = data
                    } else {
                        self.model?.results?.append(contentsOf: data.results ?? [])
                    }
                } else {
                    Utilities.shared.showAlert(on: self, with: Messages.apiErrorMessage.rawValue)
                }
            }
        }
    }
}
