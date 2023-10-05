//
//  PhotosModel.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 05.10.2023.
//

import Foundation

struct PhotosModel: Decodable {
	var response: Photos
}

struct Photos: Decodable {
	var item: [Photo]
}

struct Photo: Decodable {
	var id: Int
	var text: String?
	var sizes: [Sizes]
}

struct Sizes: Codable {
	var url: String
}
