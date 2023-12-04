//
//  Assembler.swift
//  CleanSwift
//
//  Created by Daniil Rassadin on 4/12/23.
//

import UIKit

final class Assembler {
    static func build() -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor(presenter: presenter)
        let viewController = ViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
