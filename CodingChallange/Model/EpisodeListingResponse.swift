//
//  EpisodeListingResponse.swift
//  CodingChallange
//
//  Created by Telha Wasim on 16/03/2024.
//

import Foundation

// MARK: - EpisodeListingResponse
struct EpisodeListingResponse: Codable {
    var id, airDate: String?
    var episodes: [Episode]?
    var name, overview: String?
    var welcomeID: Int?
    var posterPath: String?
    var seasonNumber: Int?
    var voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case airDate = "air_date"
        case episodes, name, overview
        case welcomeID = "id"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case voteAverage = "vote_average"
    }
}

// MARK: - Episode
struct Episode: Codable {
    var airDate: String?
    var episodeNumber: Int?
    var episodeType: String?
    var id: Int?
    var name, overview, productionCode: String?
    var runtime, seasonNumber, showID: Int?
    var stillPath: String?
    var voteAverage: Double?
    var voteCount: Int?
    var crew, guestStars: [Crew]?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case episodeType = "episode_type"
        case id, name, overview
        case productionCode = "production_code"
        case runtime
        case seasonNumber = "season_number"
        case showID = "show_id"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case crew
        case guestStars = "guest_stars"
    }
}

// MARK: - Crew
struct Crew: Codable {
    var job: String?
    var department: String?
    var creditID: String?
    var adult: Bool?
    var gender, id: Int?
    var knownForDepartment: String?
    var name, originalName: String?
    var popularity: Double?
    var profilePath: String?
    var character: String?
    var order: Int?

    enum CodingKeys: String, CodingKey {
        case job, department
        case creditID = "credit_id"
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case character, order
    }
}
