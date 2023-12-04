//
//  Interactor.swift
//  CleanSwift
//
//  Created by Daniil Rassadin on 4/12/23.
//

import Foundation

protocol InteractorProtocol {
    func updateScreen()
}

final class Interactor: InteractorProtocol {
    
    private let presenter: PresenterProtocol
    
    init(presenter: PresenterProtocol) {
        self.presenter = presenter
    }
    
    func updateScreen() {
        presenter.updateScreen()
    }
    
    func get(number: Int) -> Int {
        number > 10 ? number * 3 : number - 3
    }
    
    func getCharacters(from string: String?, characters: Interactor.Characters) -> [Character] {
        guard let string, !string.isEmpty else { return [] }
        switch characters {
        case .first:
            return [string.first].compactMap { $0 }
        case .last:
            return [string.last].compactMap { $0 }
        case .all:
            return Array(string)
        }
    }
    
    func checkString(a: String, b: String) {
        if a.contains(b) {
//            presenter.updateScreen()
        }
    }
    
    enum Characters {
        case first, last, all
    }
}
