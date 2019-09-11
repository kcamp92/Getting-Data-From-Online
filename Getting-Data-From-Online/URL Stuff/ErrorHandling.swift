//
//  ErrorHandling.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation
enum ErrorHandling: Error {
    case badURL
    case decodingError
    case noData
}
