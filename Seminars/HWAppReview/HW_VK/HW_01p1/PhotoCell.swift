//
//  PhotosCell.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//
// MARK: - Photo cell display settings

import UIKit

final class PhotoCell: UICollectionViewCell {

	// MARK: Presetting the display of the photo
	private var photoView = UIImageView()

	// MARK: - Cell initialization
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Updating a cell with data obtained from models
	func updateCell(model: Photo) {
		DispatchQueue.global().async {
			if let url = URL(string: model.sizes[1].url ),
			   let data = try? Data(contentsOf: url) {
				DispatchQueue.main.async {
					self.photoView.image = UIImage(data: data)
				}
			}
		}
	}

	// MARK: - Reusing a cell in the Photo List for scrolling
	override func prepareForReuse() {
		super.prepareForReuse()
		photoView.image = nil
	}

	// MARK: - Setting the display of cell elements on the screen
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
