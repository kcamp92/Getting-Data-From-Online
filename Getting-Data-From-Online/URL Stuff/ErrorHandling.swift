//
//  ErrorHandling.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case notAnImage
    case other(rawError:String)
    case networkError
    case badHTTPResponse
    case notFound
    case unauthorized
}
