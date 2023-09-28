//
//  ViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 28.09.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private var view1: UIImageView = {
		let imageView = UIImageView(image: UIImage(systemName: "dog"))
		imageView.backgroundColor = .white
		return imageView
	}()
	
	private var view2: UILabel = {
		let label = UILabel()
		label.text = "Authorization"
		label.textAlignment = .center
		label.backgroundColor = .white
		label.textColor = .black
		return label
	}()
	
	private var view3: UITextField = {
		let textView = UITextField()
		textView.placeholder = "Username"
		textView.textAlignment = .left
		textView.backgroundColor = .white
		return textView
	}()
	
	private var view4: UITextField = {
		let textView = UITextField()
		textView.placeholder = "Password"
		textView.isSecureTextEntry = true
		textView.textAlignment = .left
		textView.backgroundColor = .white
		return textView
	}()
	
	private var view5: UIButton = {
		let button = UIButton()
		button.setTitle("Log in", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.backgroundColor = .white
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
		
		setupViews()
	}
	
	private func setupViews() {
		view.addSubview(view1)
		view.addSubview(view2)
		view.addSubview(view3)
		view.addSubview(view4)
		view.addSubview(view5)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		view1.translatesAutoresizingMaskIntoConstraints = false
		view2.translatesAutoresizingMaskIntoConstraints = false
		view3.translatesAutoresizingMaskIntoConstraints = false
		view4.translatesAutoresizingMaskIntoConstraints = false
		view5.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			view1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			view1.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
			view1.heightAnchor.constraint(equalToConstant: view.frame.size.width / 3),
			
			view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 40),
			view2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			view2.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
			view2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			
			view3.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 20),
			view3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			view3.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
			view3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			
			view4.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 10),
			view4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			view4.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
			view4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			
			view5.topAnchor.constraint(equalTo: view4.bottomAnchor, constant: 20),
			view5.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			view5.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
			view5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
		])
	}
	
	
}

