//
//  Theme.swift
//  Cities
//
//  Created by Daniil Rassadin on 30/11/23.
//

import UIKit

final class Theme {
    static var currentTheme: ThemeProtocol = WhiteTheme()
}

protocol ThemeProtocol {
    var backgroundColor: UIColor { get }
}

final class WhiteTheme: ThemeProtocol {
    var backgroundColor: UIColor = .white
}

final class BlueTheme: ThemeProtocol {
    var backgroundColor: UIColor = .blue
}

final class GreenTheme: ThemeProtocol {
    var backgroundColor: UIColor = .green
}
