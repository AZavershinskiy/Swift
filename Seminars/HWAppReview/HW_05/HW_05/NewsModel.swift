//
//  NewsModel.swift
//  HW_05
//
//  Created by Andrey Zavershinskiy on 03.12.2023.
//

import Foundation

struct NewsModel: Decodable {
	var results: [NewsItem]?
}

struct NewsItem: Decodable, Identifiable {
	var id: Int
	var publicationDate: Int
	var title: String
	var bodyText: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case publicationDate = "publication_date"
		case title
		case bodyText = "body_text"
	}
}

