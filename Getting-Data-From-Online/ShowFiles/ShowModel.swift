//
//  ShowModel.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct ShowWrapper: Codable {
    let show: Shows
}
struct Shows: Codable {
    let id: Int
    let name: String
    let rating: Rating
    let image: Image?
}

struct Rating: Codable {
    let average: Double?
}

struct Image: Codable {
    let original: String
}

class ShowsAPIManager {
    
    private init() {}
    static let shared = ShowsAPIManager()
    
    func getShows(showTitle: String?, completionHandler: @escaping (Result<[ShowWrapper],AppError>)-> Void){
        
        var showURL = "http://api.tvmaze.com/search/shows?q=girls"
        
        if let show = showTitle {
            let newStr = show.replacingOccurrences(of: " ", with: "-")
            
            showURL = "http://api.tvmaze.com/search/shows?q=\(newStr)"
        }
        NetworkManager.shared.fetchData(urlString: showURL) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let showData = try JSONDecoder().decode([ShowWrapper].self, from: data)
                    completionHandler(.success(showData))
                } catch {
                    print(error)
                    completionHandler(.failure(.invalidJSONResponse))
                    
                }
            }
        }
    }
}

