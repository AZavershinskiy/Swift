//
//  ViewController.swift
//  Cities
//
//  Created by Daniil Rassadin on 13/11/23.
//

import UIKit

final class ViewController: UIViewController {
    private var isColorChanged = false
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.text = "My first app!"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to the new screen.", for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let newButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change the screen's color.", for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let goToTableViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to the TableView.", for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let goToCollectionViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to the CollectionView.", for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        setupView()
        setupConstraints()
        
        button.addTarget(
            self,
            action: #selector(goToNewController),
            for: .touchUpInside
        )
        
        newButton.addTarget(
            self,
            action: #selector(changeViewColor),
            for: .touchUpInside
        )
        
        goToTableViewButton.addTarget(self, action: #selector(goToTableView), for: .touchUpInside)
        
        goToCollectionViewButton.addTarget(self, action: #selector(goToCollectionView), for: .touchUpInside)
    }
    
    private func setupView() {
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(newButton)
        view.addSubview(goToTableViewButton)
        view.addSubview(goToCollectionViewButton)
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        newButton.translatesAutoresizingMaskIntoConstraints = false
        goToTableViewButton.translatesAutoresizingMaskIntoConstraints = false
        goToCollectionViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // MARK: label
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.width / 4),
            
            // MARK: button
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // MARK: newButton
            newButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // MARK: goToTableViewButton
            goToTableViewButton.topAnchor.constraint(equalTo: newButton.bottomAnchor, constant: 20),
            goToTableViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            goToTableViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // MARK: goToCollectionViewButton
            goToCollectionViewButton.topAnchor.constraint(equalTo: goToTableViewButton.bottomAnchor, constant: 20),
            goToCollectionViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            goToCollectionViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

#Preview {
    ViewController()
}

// MARK: - Objective-C methods
private extension ViewController {
    @objc func goToNewController() {
        navigationController?.pushViewController(NewViewController(), animated: true)
//        view.addSubview(NewViewController().view)
    }
    
    @objc func changeViewColor() {
        isColorChanged.toggle()
        view.backgroundColor = isColorChanged ? .yellow : .white
    }
    
    @objc func goToTableView() {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    @objc func goToCollectionView() {
        navigationController?.pushViewController(
            CollectionViewController(
                collectionViewLayout: UICollectionViewFlowLayout()
            ),
            animated: true
        )
    }
}
