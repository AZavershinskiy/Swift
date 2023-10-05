//
//  TownModel.swift
//  CreateApp
//
//  Created by Анастасия Рябова on 15.05.2023.
//

struct TownModel: Codable {
    var name: String
    var timezone: String
    var coords: Coordinate
    var currency: String
}

struct Coordinate: Codable {
    var lat: Double?
    var lon: Double?
}
