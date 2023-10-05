//
//  NetworkService.swift
//  CreateApp
//
//  Created by Анастасия Рябова on 15.05.2023.
//

import Foundation

final class NetworkService {
	private let session = URLSession.shared
	
	func getData() {
		let url = URL(string: "https://kudago.com/public-api/v1.2/locations/?lang=ru&fields=timezone,name,currency,coords")
		
		session.dataTask(with: url!) { (data, _, error) in
			guard let data = data else { return }
			do {
				let towns = try JSONDecoder().decode([TownModel].self, from: data)
				print(towns)
			} catch { print(error) }
		}.resume()
	}
	
	func getCat(with code: Int) {
		let url = URL(string: "https://http.cat/" + String(code))
		
		guard let url = url else { return }
		session.dataTask(with: url) { (data, _, error) in
			print(data!)
		}.resume()
	}
	
	func getNews() {
		let url = URL(string: "https://kudago.com/public-api/v1.4/news/?fields=publication_date,title,body_text&text_format=text&actual_only=true")
		
		guard let url else { return }
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let news = try JSONDecoder().decode(NewsModel.self, from: data)
				print(news)
			} catch { print(error) }
		}.resume()
	}
	
	func getPlaces() {
		guard let url = URL(string: "https://kudago.com/public-api/v1.2/places/") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let places = try JSONDecoder().decode(PlacesModel.self, from: data)
				print(places)
			} catch { print(error) }
		}.resume()
	}
	
	func getMovies() {
		let url = URL(string: "https://kudago.com/public-api/v1.2/movies/?fields=site_url,title,body_text,country,year,imdb_rating")
		
		session.dataTask(with: url!) { (data, _, error) in
			guard let data = data else { return }
			do {
				let movies = try JSONDecoder().decode(MoviesModel.self, from: data)
				print(movies)
			} catch { print(error) }
		}.resume()
	}
	
	func getDogImage() {}
}
