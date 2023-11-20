//
//  Movie.swift
//  Cities
//
//  Created by Daniil Rassadin on 20/11/23.
//

import Foundation

struct MoviesResults: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let siteURL: String
    let title: String
    let bodyText: String
    let country: String
    let year: Int
    let imdbRating: Double
    
    enum CodingKeys: String, CodingKey {
        case siteURL = "site_url"
        case title
        case bodyText = "body_text"
        case country
        case year
        case imdbRating = "imdb_rating"
    }
}
