//
//  ProfileViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 30.11.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
	private var person = Profile()
	
	private var personImageView = UIImageView()
	
	private var personFullName: UILabel = {
		let label = UILabel()
		label.text = "Name"
		label.textAlignment = .center
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Profile"
		NetworkService().getProfileData{ [weak self] person in
			self?.person = person
			DispatchQueue.main.async {
				self?.reloadInputViews()
			}
		}
		personFullName.text = (person.firstName) + " " + (person.lastName)
		DispatchQueue.global().async {
			if let url = URL(string: self.person.photo ?? ""),
			   let data = try? Data(contentsOf: url)
			{
				DispatchQueue.main.async {
					self.personImageView.image = UIImage(data: data)
				}
			}
		}
	}
	
	private func setupViews() {
		view.addSubview(personImageView)
		view.addSubview(personFullName)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		personImageView.translatesAutoresizingMaskIntoConstraints = false
		personFullName.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			personImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			personImageView.widthAnchor.constraint(equalToConstant: 50),
			personImageView.heightAnchor.constraint(equalToConstant: 50),
			
			personFullName.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 5),
			personFullName.centerYAnchor.constraint(equalTo: personImageView.centerYAnchor)
			
		])
	}
}
