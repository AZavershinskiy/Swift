//
//  FriendCell.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class FriendCell: UITableViewCell {
	
	private var friendImageView = UIImageView(image: UIImage(systemName: "dog"))
	
	private var text: UILabel = {
		let label = UILabel()
		label.text = "Friend's name"
		label.textColor = .black
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
	
	private func setupViews() {
		contentView.addSubview(friendImageView)
		contentView.addSubview(text)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		friendImageView.translatesAutoresizingMaskIntoConstraints = false
		text.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			friendImageView.heightAnchor.constraint(equalToConstant: 50),
			friendImageView.widthAnchor.constraint(equalTo: friendImageView.heightAnchor),
			
			text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			text.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
			text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
		])
	}
	
}
