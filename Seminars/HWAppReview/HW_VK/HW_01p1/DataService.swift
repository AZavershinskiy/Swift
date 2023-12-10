//
//  DataService.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 09.12.2023.
//

import Foundation
import CoreData

final class DataService {
	
	lazy var persistentContainer: NSPersistentContainer = {
		let persistentContainer = NSPersistentContainer(name: "CoreData")
		persistentContainer.loadPersistentStores(completionHandler: { (_, error) in
			if let error = error {
				print(error)
			}
		})
		return persistentContainer
	}()
	
	func save() {
		if persistentContainer.viewContext.hasChanges {
			do {
				try persistentContainer.viewContext.save()
			} catch {
				print(error)
			}
		}
	}
	
	func addFriends(friends: [Friend]) {
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendModelCD")
		for friend in friends {
			request.predicate = NSPredicate(format: "id=%@", argumentArray: [friend.id])
			let result = try? persistentContainer.viewContext.fetch(request)
			guard result?.first == nil else { continue }
			let friendModel = FriendModelCD(context: persistentContainer.viewContext)
			friendModel.id = Int64(friend.id)
			friendModel.firstName = friend.firstName
			friendModel.lastName = friend.lastName
			friendModel.photo = friend.photo
			friendModel.online = Int16(friend.online)
		}
		save()
//		addFriendDate()
	}
	
	func getFriends() -> [Friend] {
		let request: NSFetchRequest<FriendModelCD> = FriendModelCD.fetchRequest()
		guard let friends = try? persistentContainer.viewContext.fetch(request) else { return [] }
		var newFrinds: [Friend] = []
		for friend in friends {
			newFrinds.append(Friend(id: Int(friend.id), firstName: friend.firstName, lastName: friend.lastName, photo: friend.photo, online: Int(friend.online)))
		}
		return newFrinds
	}
	
	func addFriendDate() {

	}
	
//	func delete(object: NSManagedObject) {
//		persistentContainer.viewContext.delete(object)
//		save()
//	}

}
