//
//  NewsModel.swift
//  CreateApp
//
//  Created by Анастасия Рябова on 15.05.2023.
//

struct NewsModel: Decodable {
    var results: [News]
}

struct News: Decodable {
    var date: Int
    var title: String
    var text: String

    enum CodingKeys: String, CodingKey {
        case date = "publication_date"
        case title
        case text = "body_text"
    }
}
