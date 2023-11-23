//
//  CustomTableViewCell.swift
//  Cities
//
//  Created by Daniil Rassadin on 16/11/23.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
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
    
    private let cityView: UIView = {
        let view = UIView()
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
    
    func configureCell(city: City) {
        firstLabel.text = city.name
        secondLabel.text = city.timezone
        thirdLabel.text = city.currency
        cityView.backgroundColor = city.coords.lat + city.coords.lon < 100 ? UIColor(red: 106 / 255, green: 255, blue: 236 / 255, alpha: 1) : UIColor(red: 148 / 255, green: 55 / 255, blue: 255, alpha: 1)
    }
    
    private func addSubviews() {
        contentView.addSubview(cityView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(thirdLabel)
    }
    
    private func setupConstraints() {
        cityView.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cityView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cityView.heightAnchor.constraint(equalToConstant: 50),
            cityView.widthAnchor.constraint(equalTo: cityView.heightAnchor),
            
            firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            firstLabel.leadingAnchor.constraint(equalTo: cityView.trailingAnchor, constant: 10),
            firstLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            secondLabel.topAnchor.constraint(equalTo: firstLabel.topAnchor, constant: 20),
            secondLabel.leadingAnchor.constraint(equalTo: cityView.trailingAnchor, constant: 10),
            secondLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.topAnchor, constant: 20),
            thirdLabel.leadingAnchor.constraint(equalTo: cityView.trailingAnchor, constant: 10),
            thirdLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            thirdLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}

#Preview {
    CustomTableViewCell()
}
