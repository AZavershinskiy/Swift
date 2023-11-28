//
//  FriendCell.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class FriendCell: UITableViewCell {
	
	private var friendImageView = UIImageView()
	
	private var friendOnline: UILabel = {
		let label = UILabel()
		label.text = "Online"
		label.textAlignment = .left
		return label
	}()
	
	private var friendFullName: UILabel = {
		let label = UILabel()
		label.text = "Name"
		label.textAlignment = .left
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func updateCell(model: Friend) {
		friendFullName.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
		friendOnline.text = model.online == 0 ? "Offline" : "Online"
		friendOnline.textColor = model.online == 0 ? .gray : .blue
		DispatchQueue.global().async {
			if let url = URL(string: model.photo ?? ""),
			   let data = try? Data(contentsOf: url)
			{
				DispatchQueue.main.async {
					self.friendImageView.image = UIImage(data: data)
				}
			}
		}
	}
	
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
			
			friendOnline.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			friendOnline.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
			friendOnline.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			
			friendFullName.topAnchor.constraint(equalTo: friendOnline.bottomAnchor, constant: 5),
			friendFullName.leadingAnchor.constraint(equalTo: friendOnline.leadingAnchor),
			friendFullName.trailingAnchor.constraint(equalTo: friendOnline.trailingAnchor),
			friendFullName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
		])
	}
}

