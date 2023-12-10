//
//  ThemeViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 07.12.2023.
//

import UIKit

final class ThemeViewController: UIViewController {
	
	private var buttonThemeWhite: UIButton = {
		let button = UIButton()
		button.setTitle("White theme", for: .normal)
		button.setTitleColor(WhiteTheme().textColor, for: .normal)
		button.layer.borderColor = UIColor.black.cgColor
		button.layer.borderWidth = 2
		button.layer.cornerRadius = 20
		button.backgroundColor = WhiteTheme().backroundColor
		return button
	}()
	
	private var buttonThemeBlue: UIButton = {
		let button = UIButton()
		button.setTitle("Blue theme", for: .normal)
		button.setTitleColor(BlueTheme().textColor, for: .normal)
		button.layer.borderColor = UIColor.white.cgColor
		button.layer.borderWidth = 2
		button.layer.cornerRadius = 20
		button.backgroundColor = BlueTheme().backroundColor
		return button
	}()
	
	private var buttonThemeGreen: UIButton = {
		let button = UIButton()
		button.setTitle("Green theme", for: .normal)
		button.setTitleColor(GreenTheme().textColor, for: .normal)
		button.layer.borderColor = UIColor.black.cgColor
		button.layer.borderWidth = 2
		button.layer.cornerRadius = 20
		button.backgroundColor = GreenTheme().backroundColor
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Themes"
		
		view.backgroundColor = Theme.currentTheme.backroundColor
		
		buttonThemeWhite.addTarget(self, action: #selector(tapWhiteTheme), for: .touchUpInside)
		buttonThemeBlue.addTarget(self, action: #selector(tapBlueTheme), for: .touchUpInside)
		buttonThemeGreen.addTarget(self, action: #selector(tapGreenTheme), for: .touchUpInside)
		
		setupViews()
	}
	
	private func setupViews() {
		view.addSubview(buttonThemeWhite)
		view.addSubview(buttonThemeBlue)
		view.addSubview(buttonThemeGreen)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		buttonThemeWhite.translatesAutoresizingMaskIntoConstraints = false
		buttonThemeBlue.translatesAutoresizingMaskIntoConstraints = false
		buttonThemeGreen.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			buttonThemeBlue.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			buttonThemeBlue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			buttonThemeBlue.heightAnchor.constraint(equalToConstant: 50),
			buttonThemeBlue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
			
			buttonThemeWhite.bottomAnchor.constraint(equalTo: buttonThemeBlue.topAnchor, constant: -20),
			buttonThemeWhite.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			buttonThemeWhite.heightAnchor.constraint(equalToConstant: 50),
			buttonThemeWhite.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
			
			buttonThemeGreen.topAnchor.constraint(equalTo: buttonThemeBlue.bottomAnchor, constant: 20),
			buttonThemeGreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			buttonThemeGreen.heightAnchor.constraint(equalToConstant: 50),
			buttonThemeGreen.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
		])
	}
	
}


private extension ThemeViewController {
	@objc func tapWhiteTheme() {
		Theme.currentTheme = WhiteTheme()
		view.backgroundColor = Theme.currentTheme.backroundColor
		navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
	}
	
	@objc func tapBlueTheme() {
		Theme.currentTheme = BlueTheme()
		view.backgroundColor = Theme.currentTheme.backroundColor
		navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
	}
	
	@objc func tapGreenTheme() {
		Theme.currentTheme = GreenTheme()
		view.backgroundColor = Theme.currentTheme.backroundColor
		navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
	}
}
