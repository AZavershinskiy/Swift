//
//  UIImageView+Extensions.swift
//  CreateApp
//
//  Created by Анастасия Рябова on 15.05.2023.
//

import UIKit

extension UIImageView {
    func downloadDogImage() {
        guard let url = URL(string: "https://random.dog/woof.json") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let imageURL = try JSONDecoder().decode(ImageModel.self, from: data)
                print(imageURL)
            } catch { print(error) }
        }.resume()
      }
}
