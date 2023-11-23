//
//  CustomCollectionViewCell.swift
//  Cities
//
//  Created by Daniil Rassadin on 16/11/23.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    var click: ((UIImage) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.image = UIImage(named: "VK Logo")
        contentView.addSubview(imageView)
        setupConstraints()
        let gestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(tap)
        )
        addGestureRecognizer(gestureRecognizer)
        imageView.getDogImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    @objc private func tap() {
        click?(imageView.image ?? UIImage())
    }
}
