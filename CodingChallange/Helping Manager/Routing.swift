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
    
    //MARK: - NAVIGATE TO LIST OF SERIES VIEW CONTROLLER -
    func navigateToListOfSeriesVC(from viewController: UIViewController, index: Int) {
        let vc = StoryboardEnum.main.getStoryboard?.instantiateViewController(withIdentifier: TVSeriesListVC.identifier) as! TVSeriesListVC
        vc.index = index
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - NAVIGATE TO SERIES DETAIL VIEW CONTROLLER -
    func navigateToSeriesDetailVC(from viewController: UIViewController, id: Int?) {
        let vc = StoryboardEnum.main.getStoryboard?.instantiateViewController(withIdentifier: TVSeriesDetailVC.identifier) as! TVSeriesDetailVC
        vc.id = id
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - NAVIGATE TO EPISODE DETAIL VIEW CONTROLLER -
    func navigateToEpisodeDetail(from viewController: UIViewController, seriesID: Int, seasonNumber: Int, episodeNumber: Int) {
        let vc = StoryboardEnum.main.getStoryboard?.instantiateViewController(withIdentifier: EpisodeDetailVC.identifier) as! EpisodeDetailVC
        vc.seriesID = seriesID
        vc.seasonNumber = seasonNumber
        vc.episodeNumber = episodeNumber
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
