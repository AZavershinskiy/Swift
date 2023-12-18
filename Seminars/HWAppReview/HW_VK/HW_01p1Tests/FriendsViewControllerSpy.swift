//
//  PresenterSpy.swift
//  HW_01p1Tests
//
//  Created by Andrey Zavershinskiy on 15.12.2023.
//

import XCTest
@testable import HW_01p1

final class FriendsViewControllerSpy: FriendsViewControllerProtocol {

	private(set) var isUpdateListCalled = false

	func updateList() {
		isUpdateListCalled = true
	}
}
