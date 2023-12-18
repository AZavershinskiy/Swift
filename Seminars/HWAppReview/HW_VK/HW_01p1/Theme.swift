//
//  Theme.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 07.12.2023.
//
// MARK: - Setting up Themes for the Application

import UIKit

/// List of available Themes
enum AllAppTheme {
	case white
	case blue
	case green
}

/// Protocol for Themes
protocol AppTheme {
	var type: AllAppTheme { get }
	var backroundColor: UIColor { get }
	var textColor: UIColor { get }
	var subtitleColor: UIColor { get }
	var textOnlineColor: UIColor { get }
}

/// Current Theme
final class Theme {
	static var currentTheme: AppTheme = WhiteTheme()
}

/// White Theme Options
final class WhiteTheme: AppTheme {
	var type: AllAppTheme = .white
	var backroundColor: UIColor = .white
	var textColor: UIColor = .black
	var subtitleColor: UIColor = .gray
	var textOnlineColor: UIColor = .blue
}

/// Blue Theme Options
final class BlueTheme: AppTheme {
	var type: AllAppTheme = .blue
	var backroundColor: UIColor = .blue
	var textColor: UIColor = .white
	var subtitleColor: UIColor = .lightGray
	var textOnlineColor: UIColor = .orange
}

/// Green Theme Options
final class GreenTheme: AppTheme {
	var type: AllAppTheme = .green
	var backroundColor: UIColor = .green
	var textColor: UIColor = .brown
	var subtitleColor: UIColor = .darkGray
	var textOnlineColor: UIColor = .blue
}
