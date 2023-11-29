//
//  UIImageView+Extensions.swift
//  Cities
//
//  Created by Daniil Rassadin on 20/11/23.
//

import UIKit

extension UIImageView {
    func getDogImage() {
        guard let url = URL(string: "https://random.dog/woof.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data else { return }
            
            let pictureURL = try? JSONDecoder().decode(DogPicture.self, from: data).url
            
            guard let url = URL(string: pictureURL ?? "") else { return }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let data, let picture = UIImage(data: data) else { return }
                DispatchQueue.main.async { self?.image = picture }
            }.resume()
        }.resume()
    }
}
