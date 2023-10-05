//
//  GroupsModel.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 05.10.2023.
//

import Foundation

struct GroupsModel: Decodable {
	var response: Groups
}

struct Groups: Decodable {
	var item: [Group]
}

struct Group: Decodable {
	var id: Int
	var name: String?
	var photo: String?
	var description: String?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case photo = "photo_50"
		case description
	}
}

