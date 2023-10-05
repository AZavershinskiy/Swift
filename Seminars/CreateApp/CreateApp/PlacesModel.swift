//
//  PlacesModel.swift
//  CreateApp
//
//  Created by Анастасия Рябова on 15.05.2023.
//

struct PlacesModel: Decodable {
    var results: [Place]
}

struct Place: Decodable {
    var title: String
    var address: String
    var phone: String
}
