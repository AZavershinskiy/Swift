//
//  FriendsViewControllerTests.swift
//  HW_01p1Tests
//
//  Created by Andrey Zavershinskiy on 15.12.2023.
//

import XCTest
@testable import HW_01p1

final class FriendsViewControllerTests: XCTestCase {

	private var friendsViewController: FriendsViewControllerSpy!

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		super.setUp()
		friendsViewController = FriendsViewControllerSpy()
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		friendsViewController = nil
		super.tearDown()
	}

	func testFunctionCalled() {
		friendsViewController.updateList()
		XCTAssertTrue(friendsViewController.isUpdateListCalled, "Test failed")
	}
}
