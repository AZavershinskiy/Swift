//
//  FriendsModel.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 05.10.2023.
//

import Foundation

struct FriendsModel: Decodable {
	var response: Friends
}

struct Friends: Decodable {
	var items: [Friend]
}

struct Friend: Decodable {
	var id: Int
	var firstName: String?
	var lastName: String?
	var photo: String?
	
	enum CodingKeys: String, CodingKey {
		case id
		case firstName = "first_name"
		case lastName = "last_name"
		case photo = "photo_50"
	}
}
