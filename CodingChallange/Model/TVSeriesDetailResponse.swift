//
//  TVSeriesDetailResponse.swift
//  CodingChallange
//
//  Created by Telha Wasim on 16/03/2024.
//

import Foundation

// MARK: - TVSeriesDetailResponse
struct TVSeriesDetailResponse: Codable {
    var adult: Bool?
    var backdropPath: String?
    var createdBy: [CreatedBy]?
    var episodeRunTime: [Int]?
    var firstAirDate: String?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var inProduction: Bool?
    var languages: [String]?
    var lastAirDate: String?
    var lastEpisodeToAir: LastEpisodeToAir?
    var name: String?
    var nextEpisodeToAir: LastEpisodeToAir?
    var networks: [Network]?
    var numberOfEpisodes, numberOfSeasons: Int?
    var originCountry: [String]?
    var originalLanguage, originalName, overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [Network]?
    var productionCountries: [ProductionCountry]?
    var seasons: [Season]?
    var spokenLanguages: [SpokenLanguage]?
    var status, tagline, type: String?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres, homepage, id
        case inProduction = "in_production"
        case languages
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case name
        case nextEpisodeToAir = "next_episode_to_air"
        case networks
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons
        case spokenLanguages = "spoken_languages"
        case status, tagline, type
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    var id: Int?
    var creditID, name: String?
    var gender: Int?
    var profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case creditID = "credit_id"
        case name, gender
        case profilePath = "profile_path"
    }
}

// MARK: - Genre
struct Genre: Codable {
    var id: Int?
    var name: String?
}

// MARK: - LastEpisodeToAir
struct LastEpisodeToAir: Codable {
    var id: Int?
    var name, overview: String?
    var voteAverage: Double?
    var voteCount: Int?
    var airDate: String?
    var episodeNumber: Int?
    var episodeType, productionCode: String?
    var runtime, seasonNumber, showID: Int?
    var stillPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case episodeType = "episode_type"
        case productionCode = "production_code"
        case runtime
        case seasonNumber = "season_number"
        case showID = "show_id"
        case stillPath = "still_path"
    }
}

// MARK: - Network
struct Network: Codable {
    var id: Int?
    var logoPath, name: String?
    var originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

// MARK: - OriginCountry
enum OriginCountry: String, Codable {
    case jp = "JP"
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    var iso3166_1: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

// MARK: - Season
struct Season: Codable {
    var airDate: String?
    var episodeCount, id: Int?
    var name, overview, posterPath: String?
    var seasonNumber: Int?
    var voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id, name, overview
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case voteAverage = "vote_average"
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    var englishName, iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}

