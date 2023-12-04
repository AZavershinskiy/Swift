//
//  ViewController.swift
//  CleanSwift
//
//  Created by Daniil Rassadin on 4/12/23.
//

import UIKit

protocol ViewControllerProtocol: AnyObject {
    func updateScreen()
}

final class ViewController: UIViewController, ViewControllerProtocol {
    
    private let interactor: InteractorProtocol
    
    init(interactor: InteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateScreen() {
        interactor.updateScreen()
    }
}

