//
//  NetworkManager.swift
//  CodingChallange
//
//  Created by Telha Wasim on 15/03/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private var accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZmMyN2IwZTlmNWYxZGMzZjgyZTY3NGRmNGI5NzNiNCIsInN1YiI6IjY1ZjM5N2QyNmU5MzhhMDE0OWNjMTQ2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bXPle3jNVq26UTI1Ag1TE0em1HxBlobvQxViy1saqjA"
    private var apiKey = "bfc27b0e9f5f1dc3f82e674df4b973b4"
    private var headers: HTTPHeaders {
        return [
            "accept": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
    }
    
    func request<T>(endPoint: String, method: HTTPMethod, parameters: [String: Any]? = nil, completion: @escaping (T?) -> Void) where T: Decodable {
        AF.request(endPoint, method: method, parameters: parameters, headers: headers).validate().responseData { response in
            guard let data = response.data else {
                print("Warning: No data received in response.")
                completion(nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
