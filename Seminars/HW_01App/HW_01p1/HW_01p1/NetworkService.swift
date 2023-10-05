//
//  NetworkService.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 05.10.2023.
//

import Foundation

final class NetworkService {
	private let session = URLSession.shared
	
	static var token = ""
//	static var userID = ""
	
	func getFriends() {
		guard let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_50&access_token=\(NetworkService.token)&v=5.154") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
				print(friends)
			} catch { print(error) }
		}.resume()
	}
	
	func getGroups() {
		guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(NetworkService.token)&fields=description&v=5.154&extended=1") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
				print(groups)
			} catch { print(error) }
		}.resume()
	}
	
	func getPhotos() {
		guard let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.token)&v=5.154&album_id=profile") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let photos = try JSONDecoder().decode(GroupsModel.self, from: data)
				print(photos)
			} catch { print(error) }
		}.resume()
	}
}
