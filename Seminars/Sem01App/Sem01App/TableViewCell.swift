//
//  TableViewCell.swift
//  Sem01App
//
//  Created by Andrey Zavershinskiy on 29.09.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
	
	private var circle: UIView = {
		let circle = UIView()
		circle.layer.cornerRadius = 25
		circle.backgroundColor = .green
		return circle
	}()
	
	private var text1: UILabel = {
		let text = UILabel()
		text.text = "Text1"
		text.textColor = .black
		return text
	}()
	
	private var text2: UILabel = {
		let text = UILabel()
		text.text = "Text2"
		text.textColor = .black
		return text
	}()
	
	private var text3: UILabel = {
		let text = UILabel()
		text.text = "Text3"
		text.textColor = .black
		return text
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
		contentView.addSubview(circle)
		contentView.addSubview(text1)
		contentView.addSubview(text2)
		contentView.addSubview(text3)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		circle.translatesAutoresizingMaskIntoConstraints = false
		text1.translatesAutoresizingMaskIntoConstraints = false
		text2.translatesAutoresizingMaskIntoConstraints = false
		text3.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			circle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			circle.heightAnchor.constraint(equalToConstant: 50),
			circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
			
			text1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			text1.leftAnchor.constraint(equalTo: circle.rightAnchor, constant: 30),
			text1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			
			text2.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 10),
			text2.leftAnchor.constraint(equalTo: circle.rightAnchor, constant: 30),
			text2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			
			text3.topAnchor.constraint(equalTo: text2.bottomAnchor, constant: 10),
			text3.leftAnchor.constraint(equalTo: text2.leftAnchor),
			text3.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			text3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
		])
	}

}
