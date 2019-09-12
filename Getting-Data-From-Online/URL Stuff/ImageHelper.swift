//
//  Image Helper.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
    private init() {}
    
static let shared = ImageHelper()
    
    func getImage(urlString: String, completionHandler: @escaping(Result<UIImage, Error>) -> Void){
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(AppError.badURL))
            return
        }
        URLSession.shared.dataTask(with: url){(data, _, error) in guard error == nil else {
            completionHandler(.failure(AppError.noDataReceived))
            return
            }
            guard let data = data else {
                completionHandler(.failure(AppError.notFound))
                return
            }
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(AppError.badStatusCode))
                return
            }
            completionHandler(.success(image))
        }
        .resume()
    }
}

