//
//  PhotosViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class PhotosViewController: UICollectionViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Photos"
		collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: Constants.Identifier.photoCellIdentifier)
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		6
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.photoCellIdentifier, for: indexPath) as? PhotoCell else {
			return UICollectionViewCell()
		}
		return cell
	}
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = UIScreen.main.bounds.width
		let cellSize = width / 2 - 20
		return CGSize(width: cellSize, height: cellSize)
	}
}
