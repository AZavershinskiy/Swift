//
//  NetworkService.swift
//  Cities
//
//  Created by Daniil Rassadin on 20/11/23.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    func fetchData() {
        guard let url = URL(string: "https://kudago.com/public-api/v1.2/locations/?lang=ru&fields=timezone,name,currency,coords") else {
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            guard let data else { return }
            
            do {
                let cities = try JSONDecoder().decode([City].self, from: data)
                print(cities)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getCatError(errorCode: Int) {
        guard let url = URL(string: "https://http.cat/\(errorCode)") else { return }
        
        session.dataTask(with: url) { data, _, _ in
            print(data)
        }.resume()
    }
    
    func getNews() {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?fields=publication_date,title,body_text&text_format=text&actual_only=true") else { return }
        
        session.dataTask(with: url) { data, response, error in
            guard let data else { return }
            
            do {
                let cities = try JSONDecoder().decode(NewsResult.self, from: data).results
                print(cities)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPlaces() {
        guard let url = URL(string: "https://kudago.com/public-api/v1.2/places/") else { return }
        
        session.dataTask(with: url) { data, response, error in
            guard let data else { return }
            
            do {
                let cities = try JSONDecoder().decode(PlacesResults.self, from: data).results
                print(cities)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getMovies() {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/movies/?fields=title,site_url,body_text,country,year,imdb_rating") else { return }
        
        session.dataTask(with: url) { data, response, error in
            guard let data else { return }
            
            do {
                let cities = try JSONDecoder().decode(MoviesResults.self, from: data).results
                print(cities)
            } catch {
                print(error)
            }
        }.resume()
    }
}
