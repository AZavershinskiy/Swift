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
		guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=\(NetworkService.token)&fields=photo_50,online&v=5.199&count=10") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let friends = try JSONDecoder().decode(FriendsModel.self, from: data).response.items
				completion(friends)
			} catch { print(error) }
		}.resume()
	}
	
	func getGroups(completion: @escaping ([Group]) -> Void) {
		guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(NetworkService.token)&fields=description&v=5.199&extended=1&count=10") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let groups = try JSONDecoder().decode(GroupsModel.self, from: data).response.items
				completion(groups)
			} catch { print(error) }
		}.resume()
	}
	
	func getPhotos(completion: @escaping ([Photo]) -> Void) {
		guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=\(NetworkService.token)&v=5.199&&album_id=profile&count=10") else { return }
		
		session.dataTask(with: url) { (data, _, error) in
			guard let data = data else { return }
			do {
				let photos = try JSONDecoder().decode(PhotosModel.self, from: data).response.items
				completion(photos ?? [])
			} catch { print(error) }
		}.resume()
	}
	
}
