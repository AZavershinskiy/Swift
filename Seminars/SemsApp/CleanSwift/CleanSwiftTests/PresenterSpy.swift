//
//  PresenterSpy.swift
//  CleanSwiftTests
//
//  Created by Daniil Rassadin on 5/12/23.
//

import Foundation
@testable import CleanSwift

final class PresenterSpy: PresenterProtocol {
    private(set) var wasCalledUpdateScreen = false
    
    func updateScreen() {
        wasCalledUpdateScreen = true
    }
}
