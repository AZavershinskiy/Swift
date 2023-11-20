//
//  News.swift
//  Cities
//
//  Created by Daniil Rassadin on 20/11/23.
//

import Foundation

struct NewsResult: Decodable {
    let results: [News]
}

struct News: Decodable {
    let publicationDate: Int
    let title: String
    let bodyText: String
    
    enum CodingKeys: String, CodingKey {
        case publicationDate = "publication_date"
        case title
        case bodyText = "body_text"
    }
}
