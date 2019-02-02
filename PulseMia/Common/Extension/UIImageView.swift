//
//  File.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(with url: String) {
        guard let imageURL = URL(string: url) else { return }
        setImage(with: imageURL)
    }
    
    private func setImage(with url: URL) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil,
                let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async() {
                self.image = image
            }
        }
        dataTask.resume()
    }
}
