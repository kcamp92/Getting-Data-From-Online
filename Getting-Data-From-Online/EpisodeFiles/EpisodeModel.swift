//
//  EpisodeModel.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct EpisodeWrapper: Codable {
    let name: String
    let season: Int
    let number: Int
    let summary: String?
    let image: Picture?
    
    func lazyWayOut()-> String {
        return "Season:\(season) Episode:\(number)"
    }
}

struct Picture: Codable {
    let original: String
    let medium: String
}

class EpisodesAPIManager {
    private init() {}
    static let shared = EpisodesAPIManager()
    
    func getEpisodes(episodeTitle: Int?, completionHandler: @escaping(Result<[EpisodeWrapper],AppError>)-> Void){
        
        var showURL = "http://api.tvmaze.com/shows/200/episodes"
        if let episode = episodeTitle {
            showURL = "http://api.tvmaze.com/shows/\(episode)/episodes"
        }
        NetworkManager.shared.fetchData(urlString: showURL){(result) in switch result {
        case .failure(let error):
            completionHandler(.failure(error))
        case .success(let data):
            do {
                let showData = try JSONDecoder().decode([EpisodeWrapper].self, from: data)
                completionHandler(.success(showData))
            } catch {
                print(error)
                completionHandler(.failure(.invalidJSONResponse))
                
                }
            }
        }
    }
}
