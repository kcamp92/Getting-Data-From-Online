//
//  NetworkHelper.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/12/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private init() {}
    
    static let shared = NetworkManager()
    
    //Performs GET requests for any URL
    //Parameters: URL as a string
    //Completion: Result with Data in success, AppError in failure
    
    func fetchData(urlString: String,  completionHandler: @escaping (Result<Data,AppError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completionHandler(.failure(.networkError))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionHandler(.failure(.badHTTPResponse))
                return
            }
            switch response.statusCode {
            case 404:
                completionHandler(.failure(.notFound))
            case 401,403:
                completionHandler(.failure(.unauthorized))
            case 200...299:
                completionHandler(.success(data))
            default:
                completionHandler(.failure(.other(rawError: "Error")))
            }
            }.resume()
    }
    
}
