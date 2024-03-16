//
//  EpisodeDetailResponse.swift
//  CodingChallange
//
//  Created by Telha Wasim on 16/03/2024.
//

import Foundation

// MARK: - EpisodeDetailResponse
struct EpisodeDetailResponse: Codable {
    var airDate: String?
    var crew: [Crew]?
    var episodeNumber: Int?
    var guestStars: [Crew]?
    var name, overview: String?
    var id: Int?
    var productionCode: String?
    var runtime, seasonNumber: Int?
    var stillPath: String?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case crew
        case episodeNumber = "episode_number"
        case guestStars = "guest_stars"
        case name, overview, id
        case productionCode = "production_code"
        case runtime
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

