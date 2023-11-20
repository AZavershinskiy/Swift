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
        
        let configuration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: configuration)
        
        session.dataTask(with: url) { data, _, _ in
            guard let data else { return }
            
            let picture = try? JSONDecoder().decode(DogPicture.self, from: data)
            
            print(picture)
        }.resume()
    }
}
