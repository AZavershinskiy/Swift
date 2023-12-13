//
//  File.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class GroupCell: UITableViewCell {
	
	private var groupsImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.layer.cornerRadius = 10
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	private var groupName: UILabel = {
		let label = UILabel()
		label.text = "Group's name"
		return label
	}()
	
	private var groupDescription: UILabel = {
		let label = UILabel()
		label.text = "Description"
		return label
	}()
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		
		setupViews()
	}
	
	func updateCell(model: Group) {
		groupName.text = model.name
		groupName.textColor = Theme.currentTheme.textColor
		groupDescription.text = model.description
		groupDescription.numberOfLines = 3
		groupDescription.textColor = Theme.currentTheme.subtitleColor
		DispatchQueue.global().async {
			if let url = URL(string: model.photo ?? ""),
			   let data = try? Data(contentsOf: url)
			{
				DispatchQueue.main.async {
					self.groupsImageView.image = UIImage(data: data)
				}
			}
		}
	}
	
	private func setupViews() {
		contentView.addSubview(groupsImageView)
		contentView.addSubview(groupName)
		contentView.addSubview(groupDescription)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		groupsImageView.translatesAutoresizingMaskIntoConstraints = false
		groupName.translatesAutoresizingMaskIntoConstraints = false
		groupDescription.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			groupsImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			groupsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			groupsImageView.heightAnchor.constraint(equalToConstant: 50),
			groupsImageView.widthAnchor.constraint(equalTo: groupsImageView.heightAnchor),
			
			groupName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			groupName.leadingAnchor.constraint(equalTo: groupsImageView.trailingAnchor, constant: 10),
			groupName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			
			groupDescription.topAnchor.constraint(equalTo: groupName.bottomAnchor, constant: 5),
			groupDescription.leadingAnchor.constraint(equalTo: groupName.leadingAnchor),
			groupDescription.trailingAnchor.constraint(equalTo: groupName.trailingAnchor),
			groupDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
		])
	}
}
