//
//  CollectionViewCell.swift
//  Sem01App
//
//  Created by Andrey Zavershinskiy on 29.09.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
	
	private var imageView = UIImageView(image: UIImage(systemName: "dog"))
	
	var tap: ((UIImage) -> Void)?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellTap))
		addGestureRecognizer(recognizer)
		
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		imageView.image = nil
	}
	
	private func setupViews() {
		addSubview(imageView)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: topAnchor),
			imageView.leftAnchor.constraint(equalTo: leftAnchor),
			imageView.rightAnchor.constraint(equalTo: rightAnchor),
			imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	@objc func cellTap() {
		tap?(imageView.image ?? UIImage())
	}
}
