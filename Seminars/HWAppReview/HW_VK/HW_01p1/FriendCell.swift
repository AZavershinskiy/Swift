//
//  FriendCell.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class FriendCell: UITableViewCell {
	
	var tap: ((String?, UIImage?) -> Void)?
	
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
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapCell))
		addGestureRecognizer(tapGestureRecognizer)
		backgroundColor = .clear
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		friendImageView.image = nil
		friendFullName.text = nil
		friendOnline.text = nil
	}
	
	func updateCell(model: Friend) {
		friendFullName.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
		friendFullName.textColor = Theme.currentTheme.textColor
		friendOnline.text = "Online"
		friendOnline.isHidden = model.online == 0 ? true : false
		friendOnline.textColor = Theme.currentTheme.textOnlineColor
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
			
			friendFullName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			friendFullName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
			friendFullName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			
			friendOnline.topAnchor.constraint(equalTo: friendFullName.bottomAnchor, constant: 5),
			friendOnline.leadingAnchor.constraint(equalTo: friendFullName.leadingAnchor),
			friendOnline.trailingAnchor.constraint(equalTo: friendFullName.trailingAnchor),
			friendOnline.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
		])
	}
	
	@objc private func tapCell() {
		tap?(friendFullName.text, friendImageView.image)
	}
}

