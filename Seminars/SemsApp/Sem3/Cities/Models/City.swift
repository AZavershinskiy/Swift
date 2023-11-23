//
//  City.swift
//  Cities
//
//  Created by Daniil Rassadin on 20/11/23.
//

import Foundation

struct City: Decodable {
    let name: String
    let timezone: String
    let coords: Coordinate
    let currency: String
    
    struct Coordinate: Decodable {
        let lat: Double
        let lon: Double
    }
}
