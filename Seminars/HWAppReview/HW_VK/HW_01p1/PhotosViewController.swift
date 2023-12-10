//
//  PhotosViewController.swift
//  HW_01p1
//
//  Created by Andrey Zavershinskiy on 16.11.2023.
//

import UIKit

final class PhotosViewController: UICollectionViewController {
	private var photos = [Photo]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Photos"
		
		collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: Constants.Identifier.photoCellIdentifier)
		NetworkService().getPhotos{ [weak self] photos in
			self?.photos = photos
			DispatchQueue.main.async {
				self?.collectionView.reloadData()
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateColor()
		collectionView.reloadData()
	}
	
	private func updateColor() {
		collectionView.backgroundColor = Theme.currentTheme.backroundColor
		navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Theme.currentTheme.textColor]
		navigationController?.tabBarItem.setTitleTextAttributes([.foregroundColor: Theme.currentTheme.textColor as UIColor], for: .normal)
		navigationController?.tabBarItem.standardAppearance?.backgroundColor = .clear
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		photos.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.photoCellIdentifier, for: indexPath) as? PhotoCell else {
			return UICollectionViewCell()
		}
		cell.updateCell(model: photos[indexPath.row])
		return cell
	}
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = UIScreen.main.bounds.width
		let cellSize = width / 2 - 5
		return CGSize(width: cellSize, height: cellSize)
	}
}
