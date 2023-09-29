//
//  ViewController.swift
//  Sem01App
//
//  Created by Andrey Zavershinskiy on 25.09.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private var label: UILabel = {
		let label = UILabel()
		label.text = "TEXT"
		label.textAlignment = .center
		label.backgroundColor = .blue
		label.textColor = .white
		return label
	}()
	
	private var button: UIButton = {
		let button = UIButton()
		button.setTitle("Go to next screen", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.green, for: .highlighted)
		button.backgroundColor = .blue
		return button
	}()
	
	private var button2: UIButton = {
		let button = UIButton()
		button.setTitle("Change collor", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.green, for: .highlighted)
		button.backgroundColor = .blue
		return button
	}()
	
	private var button3: UIButton = {
		let button = UIButton()
		button.setTitle("Go to TableVC", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.green, for: .highlighted)
		button.backgroundColor = .blue
		return button
	}()
	
	private var button4: UIButton = {
		let button = UIButton()
		button.setTitle("Go to UITableVC", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.green, for: .highlighted)
		button.backgroundColor = .blue
		return button
	}()
	
	private var isTap = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		
		setupViews()
		
		button.addTarget(self, action: #selector(tap), for: .touchUpInside)
		button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
		button3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
		button4.addTarget(self, action: #selector(tap4), for: .touchUpInside)
	}
	
	private func setupViews() {
		view.addSubview(label)
		view.addSubview(button)
		view.addSubview(button2)
		view.addSubview(button3)
		view.addSubview(button4)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		label.translatesAutoresizingMaskIntoConstraints = false
		button.translatesAutoresizingMaskIntoConstraints = false
		button2.translatesAutoresizingMaskIntoConstraints = false
		button3.translatesAutoresizingMaskIntoConstraints = false
		button4.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			label.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
			label.heightAnchor.constraint(equalToConstant: view.frame.size.width / 4),
			
			button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
			button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
			
			button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
			button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button2.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
			button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
			
			button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
			button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button3.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
			button3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
			
			button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 20),
			button4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button4.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
			button4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
		])
	}
}

private extension ViewController {
	@objc func tap() {
		navigationController?.pushViewController(NewViewController(), animated: true)
	}
	
	@objc func tap2() {
		isTap.toggle()
		if isTap {
			view.backgroundColor = .yellow
		} else {
			view.backgroundColor = .white
		}
	}
	
	@objc func tap3() {
		navigationController?.pushViewController(TableViewController(), animated: true)
	}
	
	@objc func tap4() {
		navigationController?.pushViewController(CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
	}
}
