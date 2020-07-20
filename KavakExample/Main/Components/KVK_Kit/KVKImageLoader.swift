//  KVKImageLoader.swift
//  Created by Daniel Garcia on 7/19/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import UIKit

class ImageLoader {
    
    var cache: NSCache<NSString, UIImage>!
    
    init() {
        self.cache = NSCache()
    }
    
    func obtainImageWithPath(imagePath: String?, completionHandler: @escaping (UIImage) -> ()) {
        guard let imagePath = imagePath else { return }
        if let image = self.cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            DispatchQueue.main.async {
                completionHandler(#imageLiteral(resourceName: "profile"))
            }
            guard let url: URL = URL(string: imagePath) else { return }
            URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url),
                   let img: UIImage = UIImage(data: data) {
                    self.cache.setObject(img, forKey: imagePath as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img)
                    }
                }
            }).resume()
        }
    }
}
