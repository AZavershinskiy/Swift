//
//  InteractorTests.swift
//  CleanSwiftTests
//
//  Created by Daniil Rassadin on 5/12/23.
//

import XCTest
@testable import CleanSwift

final class InteractorTests: XCTestCase {
    private var interactor: Interactor!
    private var presenter: PresenterSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        presenter = PresenterSpy()
        interactor = Interactor(presenter: presenter)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        interactor = nil
        presenter = nil
    }

    func testUpdateScreen() {
        interactor.updateScreen()
        
        XCTAssertTrue(presenter.wasCalledUpdateScreen, "Presenter's updateScreen method wasn't called.")
    }

    func testGetNumberMoreThanTen() {
        let result = interactor.get(number: 11)
        
        XCTAssertEqual(result, 33)
    }
    
    func testGetNumberLessThanTen() {
        let result = interactor.get(number: 9)
        
        XCTAssertEqual(result, 6)
    }
    
    func testGetNumberEqualTen() {
        let result = interactor.get(number: 10)
        
        XCTAssertEqual(result, 7)
    }
    
    func testGetCharactersWithEmptyString() {
        let result = interactor.getCharacters(from: "", characters: .all)
        
        XCTAssertEqual(result, [])
    }
    
    func testGetCharactersWithNilString() {
        let result = interactor.getCharacters(from: nil, characters: .all)
        
        XCTAssertEqual(result, [])
    }
    
    func testGetCharactersWithFirstChar() {
        let result = interactor.getCharacters(from: "cat", characters: .first)
        
        XCTAssertEqual(result, ["c"])
    }
    
    func testGetCharactersWithLastChar() {
        let result = interactor.getCharacters(from: "cat", characters: .last)
        
        XCTAssertEqual(result, ["t"])
    }
    
    func testGetCharactersWithAllChars() {
        let result = interactor.getCharacters(from: "cat", characters: .all)
        
        XCTAssertEqual(result, ["c", "a", "t"])
    }
    
    func testCheckStringContains() {
        interactor.checkString(a: "neighborhood", b: "neighbor")
        
        XCTAssertTrue(presenter.wasCalledUpdateScreen)
    }
    
    func testCheckStringNotContains() {
        interactor.checkString(a: "neighborhood", b: "cat")
        
        XCTAssertFalse(presenter.wasCalledUpdateScreen)
    }
}
