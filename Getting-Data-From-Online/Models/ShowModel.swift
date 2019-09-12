//
//  ShowModel.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct showWrapper: Codable {
    let name: String
    let rating: Rating
    let image: Image
}

struct Rating: Codable {
    let average: Double
}

struct Image: Codable {
    let original: String
}

class ShowsAPIManager {
    
    private init() {}
    static let shared = ShowsAPIManager()
    
    func getShows(completionHandler: @escaping (Result<showWrapper,Error>)-> Void){
        
//        var showURL = "http://api.tvmaze.com/search/shows?q=girls"
//
//        if let show = showTitle {
//            let newStr = show.replacingOccurrences(of: " ", with: "-")
//            showURL = "http://api.tvmaze.com/search/shows?q=\(newStr)"
//        }
//
//
        let urlString = "http://api.tvmaze.com/search/shows?q=girls"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(ErrorHandling.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) {(data, _, error) in guard error == nil else {
            completionHandler(.failure(ErrorHandling.noData))
            return
            }
            guard let data = data else {
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            do {
                let showData = try JSONDecoder().decode(showWrapper.self, from: data)
                completionHandler(.success(showData))
            } catch {
                completionHandler(.failure(ErrorHandling.decodingError))
            }
            }.resume()
    }
}

