//
//  Utlilities.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import Foundation
import UIKit
import Alamofire
import AVKit
import AVFoundation

class Utilities {
    
    static let shared = Utilities()
    private init() {}
    
    //MARK: - SHOW ALERT
    func showAlert(on viewController: UIViewController, with message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - GET YEAR FROM DATE -
    func getYearFromDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.yyyyMMdd.rawValue

        if let date = dateFormatter.date(from: date) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            return String(year)
        } else {
            return ""
        }
    }
    
    //MARK: - LOAD IMAGE FROM URL -
    func loadImageFromURL(image: String, completion: @escaping ((UIImage) -> Void)) {
        guard let url = URL(string: ApiUrls.IMAGE_BASE_URL + image) else {
            print("Invalid URL")
            return
        }
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    print("Failed to convert data to image")
                }
            case .failure(let error):
                print("Error loading image:", error)
            }
        }
    }
    
    //MARK: - PLAY VIDEO -
    func playVideo(from url: String, in viewController: UIViewController) {
        guard let url = URL(string: url) else {return}
        
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        viewController.present(playerViewController, animated: true) {
            player.play()
        }
    }
}
