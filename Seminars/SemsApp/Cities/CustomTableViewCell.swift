//
//  CustomTableViewCell.swift
//  Cities
//
//  Created by Daniil Rassadin on 16/11/23.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 25
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(greenView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(thirdLabel)
    }
    
    private func setupConstraints() {
        greenView.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            greenView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            greenView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            greenView.heightAnchor.constraint(equalToConstant: 50),
            greenView.widthAnchor.constraint(equalTo: greenView.heightAnchor),
            
            firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            firstLabel.leadingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: 10),
            firstLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            secondLabel.topAnchor.constraint(equalTo: firstLabel.topAnchor, constant: 20),
            secondLabel.leadingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: 10),
            secondLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.topAnchor, constant: 20),
            thirdLabel.leadingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: 10),
            thirdLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            thirdLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}

#Preview {
    CustomTableViewCell()
}
