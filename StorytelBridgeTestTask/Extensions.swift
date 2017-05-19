//
//  Extensions.swift
//  StorytelBridgeTestTask
//
//  Created by Admin on 19.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

//rusel95 extension for async downloading image from url into some cache
extension UIImageView {
    
    func loadImageIntoCacheUsingUrlString(url: String) {
        
        image = nil
        
        let realUrl = URL(string: url)
        
        if realUrl != nil {
            URLSession.shared.dataTask(with: realUrl! ) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async {
                    
                    let imageToCache = UIImage(data: data!)
                    self.image = imageToCache
                }
                
                }.resume()
        }
    }
}
