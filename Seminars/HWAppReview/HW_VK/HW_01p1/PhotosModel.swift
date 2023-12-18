//
//  PhotosModel.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 21.11.2023.
//
// MARK: - Setting up a Photo List Model

import UIKit

struct PhotosModel: Decodable {
	var response: Photos
}

struct Photos: Decodable {
	var items: [Photo]?
}

struct Photo: Decodable {
	var id: Int
	var text: String
	var sizes: [Size]
}

struct Size: Codable {
	var url: String
}
