//
//  LazyImageView.swift
//  ImageLoad
//
//  Created by apple on 16/04/24.
//

import Foundation
import UIKit

class LazyImageView: UIImageView
{

    private let imageCache = NSCache<NSString, UIImage>()

    func loadImage(fromURL imageURL: URL, placeHolderImage: String)
    {
        self.image = UIImage(named: placeHolderImage)

        if let cachedImage = self.imageCache.object(forKey: imageURL.absoluteString as NSString)
        {
            debugPrint("image loaded from cache for =\(imageURL)")
            self.image = cachedImage
            return
        }

        DispatchQueue.global().async {
            [weak self] in

            if let imageData = try? Data(contentsOf: imageURL)
            {
                debugPrint("image downloaded from server...")
                if let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {
                        self!.imageCache.setObject(image, forKey: imageURL.absoluteString as NSString)
                        self?.image = image
                    }
                }
            }
        }
    }
}
