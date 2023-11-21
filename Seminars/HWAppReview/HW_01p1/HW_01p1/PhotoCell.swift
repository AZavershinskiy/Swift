//
//  PhotosCell.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
	
	private var photoView = UIImageView(image: UIImage(systemName: "cat"))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		photoView.image = nil
	}
	
	private func setupViews() {
		addSubview(photoView)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		photoView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			photoView.topAnchor.constraint(equalTo: topAnchor),
			photoView.leftAnchor.constraint(equalTo: leftAnchor),
			photoView.rightAnchor.constraint(equalTo: rightAnchor),
			photoView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}

#Preview {
	PhotoCell()
}
