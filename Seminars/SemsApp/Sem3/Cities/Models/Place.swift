//
//  Place.swift
//  Cities
//
//  Created by Daniil Rassadin on 20/11/23.
//

import Foundation

struct PlacesResults: Decodable {
    let results: [Place]
}

struct Place: Decodable {
    let title: String
    let address: String
    let phone: String
}
