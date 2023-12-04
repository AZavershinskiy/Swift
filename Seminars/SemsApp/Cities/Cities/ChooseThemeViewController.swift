//
//  ChooseThemeViewController.swift
//  Cities
//
//  Created by Daniil Rassadin on 30/11/23.
//

import UIKit

final class ChooseThemeViewController: UIViewController {
    
    private let whiteButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = WhiteTheme().backgroundColor
        return button
    }()
    
    private let blueButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = BlueTheme().backgroundColor
        return button
    }()
    
    private let greenButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = GreenTheme().backgroundColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(whiteButton)
        view.addSubview(blueButton)
        view.addSubview(greenButton)
        setupConstraints()
        whiteButton.addTarget(
            self,
            action: #selector(makeWhiteTheme),
            for: .touchUpInside
        )
        blueButton.addTarget(
            self,
            action: #selector(makeBlueTheme),
            for: .touchUpInside
        )
        greenButton.addTarget(
            self,
            action: #selector(makeGreenTheme),
            for: .touchUpInside
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    private func setupConstraints() {
        whiteButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whiteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            whiteButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
            whiteButton.heightAnchor.constraint(equalToConstant: 50),
            whiteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            blueButton.topAnchor.constraint(equalTo: whiteButton.bottomAnchor, constant: 20),
            blueButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
            blueButton.heightAnchor.constraint(equalToConstant: 50),
            blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            greenButton.topAnchor.constraint(equalTo: blueButton.bottomAnchor, constant: 20),
            greenButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
            greenButton.heightAnchor.constraint(equalToConstant: 50),
            greenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func makeWhiteTheme() {
        Theme.currentTheme = WhiteTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    @objc private func makeBlueTheme() {
        Theme.currentTheme = BlueTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    @objc private func makeGreenTheme() {
        Theme.currentTheme = GreenTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
}
