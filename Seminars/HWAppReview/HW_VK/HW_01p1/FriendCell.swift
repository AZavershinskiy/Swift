//
//  FriendCell.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//
// MARK: - Friend cell display settings

import UIKit

final class FriendCell: UITableViewCell {

	/// Passing Username and Photo from Friends List to Transition Method
	var tap: ((String?, UIImage?) -> Void)?

	/// Presetting the display of the User's photo
	private var friendImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.layer.cornerRadius = 25
		imageView.layer.masksToBounds = true
		return imageView
	}()

	/// Presetting the display of the User's status online
	private var friendOnline: UILabel = {
		let label = UILabel()
		label.text = "Online"
		label.textAlignment = .left
		return label
	}()

	/// Presetting the display of the User's name
	private var friendFullName: UILabel = {
		let label = UILabel()
		label.text = "Name"
		label.textAlignment = .left
		return label
	}()

	// MARK: - Cell initialization
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapCell))
		addGestureRecognizer(tapGestureRecognizer)
		backgroundColor = .clear
		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Reusing a cell in the Friend List for scrolling
	override func prepareForReuse() {
		super.prepareForReuse()
		friendImageView.image = nil
		friendFullName.text = nil
		friendOnline.text = nil
	}

	// MARK: - Updating a cell with data obtained from models
	func updateCell(model: Friend) {
		friendFullName.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
		friendFullName.textColor = Theme.currentTheme.textColor
		friendOnline.text = "Online"
		friendOnline.isHidden = model.online == 0 ? true : false
		friendOnline.textColor = Theme.currentTheme.textOnlineColor
		DispatchQueue.global().async {
			if let url = URL(string: model.photo ?? ""),
			   let data = try? Data(contentsOf: url) {
				DispatchQueue.main.async {
					self.friendImageView.image = UIImage(data: data)
				}
			}
		}
	}

	// MARK: - Setting the display of cell elements on the screen
	private func setupViews() {
		contentView.addSubview(friendImageView)
		contentView.addSubview(friendOnline)
		contentView.addSubview(friendFullName)
		setupConstraints()
	}
	private func setupConstraints() {
		friendImageView.translatesAutoresizingMaskIntoConstraints = false
		friendOnline.translatesAutoresizingMaskIntoConstraints = false
		friendFullName.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			friendImageView.heightAnchor.constraint(equalToConstant: 50),
			friendImageView.widthAnchor.constraint(equalTo: friendImageView.heightAnchor),

			friendFullName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			friendFullName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
			friendFullName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

			friendOnline.topAnchor.constraint(equalTo: friendFullName.bottomAnchor, constant: 5),
			friendOnline.leadingAnchor.constraint(equalTo: friendFullName.leadingAnchor),
			friendOnline.trailingAnchor.constraint(equalTo: friendFullName.trailingAnchor),
			friendOnline.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
		])
	}
}

// MARK: - @objc methods
private extension FriendCell {
	/// Method for moving from Friends List to Friend Profile
	@objc func tapCell() {
		tap?(friendFullName.text, friendImageView.image)
	}
}
