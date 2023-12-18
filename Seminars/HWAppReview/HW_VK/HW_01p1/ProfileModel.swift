//
//  ProfileModel.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 29.11.2023.
//
// MARK: - Setting up a User Profile Model

import UIKit

struct ProfileModel: Decodable {
	var response: Profile
}

struct Profile: Decodable {
	var id: Int
	var photo: String?
	var firstName: String?
	var lastName: String?

	enum CodingKeys: String, CodingKey {
		case id
		case photo = "photo_200"
		case firstName = "first_name"
		case lastName = "last_name"
	}
}
