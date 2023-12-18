//
//  DataService.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 09.12.2023.
//
// MARK: - Storing downloaded data

import Foundation
import CoreData

final class DataService {

	// MARK: Data stack
	lazy var persistentContainer: NSPersistentContainer = {
		let persistentContainer = NSPersistentContainer(name: "CoreData")
		persistentContainer.loadPersistentStores(completionHandler: { (_, error) in
			if let error = error {
				print(error)
			}
		})
		return persistentContainer
	}()

	// MARK: - Saving data after changes
	func save() {
		if persistentContainer.viewContext.hasChanges {
			do {
				try persistentContainer.viewContext.save()
			} catch {
				print(error)
			}
		}
	}

	// MARK: - Saving a Friends List
	func addFriends(friends: [Friend]) {
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendModelCD")
		for friend in friends {
			request.predicate = NSPredicate(format: "id = %@", argumentArray: [friend.id])
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
		addFriendsDate()
	}

	// MARK: - Getting a Friends List
	func getFriends() -> [Friend] {
		let request: NSFetchRequest<FriendModelCD> = FriendModelCD.fetchRequest()
		guard let friends = try? persistentContainer.viewContext.fetch(request) else { return [] }
		var newFrinds: [Friend] = []
		friends.forEach { friend in
			newFrinds.append(Friend(id: Int(friend.id), firstName: friend.firstName, lastName: friend.lastName, photo: friend.photo, online: Int(friend.online)))
		}
		return newFrinds
	}

	// MARK: - Recording the save date of the Friends List
	func addFriendsDate() {
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendsDate")
		request.predicate = NSPredicate(format: "date = %@")
		let result = try? persistentContainer.viewContext.fetch(request)
		guard result?.first == nil else { return }
		let currentDate = FriendsDate(context: persistentContainer.viewContext)
		currentDate.date = .now
		save()
	}

	// MARK: - Getting the save date of the Friends List
	func getFriendsDate() -> Date {
		let request: NSFetchRequest<FriendsDate> = FriendsDate.fetchRequest()
		guard let result = try? persistentContainer.viewContext.fetch(request) else { return Date.init(timeIntervalSince1970: 0) }
		var date: Date?
		result.forEach { item in
			date = item.date
		}
		return date ?? Date.init(timeIntervalSince1970: 0)
	}

	// MARK: - Saving a Groups List
	func addGroups(groups: [Group]) {
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupModelCD")
		for group in groups {
			request.predicate = NSPredicate(format: "id = %@", argumentArray: [group.id])
			let result = try? persistentContainer.viewContext.fetch(request)
			guard result?.first == nil else { continue }
			let groupModel = GroupModelCD(context: persistentContainer.viewContext)
			groupModel.id = Int64(group.id)
			groupModel.caption = group.description
			groupModel.name = group.name
			groupModel.photo = group.photo
		}
		save()
		addGroupsDate()
	}

	// MARK: - Getting a Groups List
	func getGroups() -> [Group] {
		let request: NSFetchRequest<GroupModelCD> = GroupModelCD.fetchRequest()
		guard let groups = try? persistentContainer.viewContext.fetch(request) else { return [] }
		var newGroups: [Group] = []
		groups.forEach { group in
			newGroups.append(Group(id: Int(group.id), name: group.name, photo: group.photo, description: group.caption))
		}
		return newGroups
	}

	// MARK: - Recording the save date of the Groups List
	func addGroupsDate() {
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupsDate")
		request.predicate = NSPredicate(format: "date = %@")
		let result = try? persistentContainer.viewContext.fetch(request)
		guard result?.first == nil else { return }
		let currentDate = GroupsDate(context: persistentContainer.viewContext)
		currentDate.date = .now
		save()
	}

	// MARK: - Getting the save date of the Groups List
	func getGroupsDate() -> Date {
		let request: NSFetchRequest<GroupsDate> = GroupsDate.fetchRequest()
		guard let result = try? persistentContainer.viewContext.fetch(request) else { return Date.init(timeIntervalSince1970: 0) }
		var date: Date?
		result.forEach { item in
			date = item.date
		}
		return date ?? Date.init(timeIntervalSince1970: 0)
	}

	//	 MARK: - Example data removal method
	//		func delete(object: NSManagedObject) {
	//			persistentContainer.viewContext.delete(object)
	//			save()
	//		}
}
