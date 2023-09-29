//
//  CollectionViewController.swift
//  Sem01App
//
//  Created by Andrey Zavershinskiy on 29.09.2023.
//

import UIKit

class CollectionViewController: UICollectionViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		6
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
		guard let cell = cell as? CollectionViewCell else {
			return UICollectionViewCell()
		}
		cell.tap = {[weak self] image in
			self?.navigationController?.pushViewController(ImageViewController(image: image), animated: true)
		}
		return cell
	}
	
	
}

