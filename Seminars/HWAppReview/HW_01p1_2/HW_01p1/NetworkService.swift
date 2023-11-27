//
//  NetworkService.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 21.11.2023.
//

import UIKit

final class NetworkService {
	private let session = URLSession.shared
	
	static var token = ""
//	static var userID = ""
	
	func getFriends(completion: @escaping ([Friend]) -> Void) {
		guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=\(NetworkService.token)&fields=photo_50,online&count=2&v=5.199") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let friends = try JSONDecoder().decode([Friend].self, from: data)
				completion(friends)
			} catch { print(error) }
		}.resume()
	}
	
	func getGroups() {
		guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(NetworkService.token)&fields=description&count=2&v=5.154&extended=1") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
				
			} catch { print(error) }
		}.resume()
	}
	
	func getPhotos() {
		guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=\(NetworkService.token)&count=1&v=5.199&album_id=profile") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let photos = try JSONDecoder().decode(PhotosModel.self, from: data)

			} catch { print(error) }
		}.resume()
	}

}
