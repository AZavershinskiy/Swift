//
//  CustomCollectionViewCell.swift
//  CreateApp
//
//  Created by Анастасия Рябова on 27.04.2023.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    var tap: ((UIImage) -> Void)?
    
    private var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
		
        setupViews()
		
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        addGestureRecognizer(recognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        imageView.downloadDogImage()
        addSubview(imageView)
		
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
		
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func cellTap() {
        tap?(imageView.image ?? UIImage())
    }
}
