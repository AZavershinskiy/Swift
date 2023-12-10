//
//  NetworkService.swift
//  HW_05
//
//  Created by Andrey Zavershinskiy on 02.12.2023.
//

import Foundation

class NetworkService {
	private let session = URLSession.shared
	
	func getNews(completion: @escaping ([NewsItem]) -> Void) {
		guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?fields=id,publication_date,title,body_text&text_format=text&actual_only=true") else { return }
		
		session.dataTask(with: url) { data, response, error in
			guard let data = data else { return }
			do {
				let news = try JSONDecoder().decode(NewsModel.self, from: data).results
				completion(news ?? [])
//				print(news)
			} catch {
				print(error)
			}
		}.resume()
	}
}
