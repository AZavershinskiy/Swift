//
//  Presenter.swift
//  CleanSwift
//
//  Created by Daniil Rassadin on 4/12/23.
//

import Foundation

protocol PresenterProtocol {
    func updateScreen()
}

final class Presenter: PresenterProtocol {
    weak var viewController: ViewControllerProtocol?
    
    func updateScreen() {
        viewController?.updateScreen()
    }
}
