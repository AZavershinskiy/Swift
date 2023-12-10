//
//  ProfileViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 30.11.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
	
	private var isUserProfile: Bool
	
	private var personImageView: UIImageView = {
		let image = UIImageView()
		image.layer.cornerRadius = 180
		image.layer.masksToBounds = true
		return image
	}()
	
	private var personFullName: UILabel = {
		let label = UILabel()
		label.text = "FullName"
		label.textAlignment = .center
		return label
	}()
	
	init(isUserProfile: Bool, photo: UIImage? = nil, fullName: String? = nil) {
		self.isUserProfile = isUserProfile
		super.init(nibName: nil, bundle: nil)
		personImageView.image = photo
		personFullName.text = fullName
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Profile"
		setupViews()
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "moon.fill"), style: .plain, target: self, action: #selector(goToThemeViewController))
		
		if isUserProfile {
			NetworkService().getProfileData{ [weak self] person in
				self?.updateUserData(person: person)
			}
		} else {
			navigationItem.rightBarButtonItem?.isHidden = true
		}
	}
	
	func updateUserData(person: Profile?) {
		guard let person = person else { return }
		DispatchQueue.main.async {
			self.personFullName.text = (person.firstName) + " " + (person.lastName)
		}
		DispatchQueue.global().async {
			if let url = URL(string: person.photo ?? ""),
			   let data = try? Data(contentsOf: url)
			{
				DispatchQueue.main.async {
					self.personImageView.image = UIImage(data: data)
				}
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tabBarController?.tabBar.isHidden = true
		updateColor()
	}
	
	private func updateColor() {
		view.backgroundColor = Theme.currentTheme.backroundColor
		personFullName.textColor = Theme.currentTheme.textColor
		navigationController?.tabBarItem.setTitleTextAttributes([.foregroundColor: Theme.currentTheme.textColor as UIColor], for: .normal)
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
			personImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			personImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			personImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.2),
			personImageView.heightAnchor.constraint(equalToConstant: view.frame.size.width / 1.2),
			
			personFullName.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 10),
			personFullName.centerXAnchor.constraint(equalTo: personImageView.centerXAnchor)
			
		])
	}
	
}


private extension ProfileViewController {
	
	@objc func goToThemeViewController() {
		let animation = CATransition()
		animation.type = .fade
		animation.duration = 0.5
		navigationController?.view.layer.add(animation, forKey: nil)
		navigationController?.pushViewController(ThemeViewController(), animated: false)
	}
}
