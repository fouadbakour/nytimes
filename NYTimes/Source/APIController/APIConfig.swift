//
//  APIConfig.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation
struct APIConfig {
    
    // MARK: - API Config Shared Instance
    static let shared = APIConfig.init()
    private init() {}
    
    // MARK: - API Session
    let manager: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = 60
        return URLSession(configuration: configuration)
    }()
}

// MARK: - API HTTP Request Content Type
enum ContentType:String {
    case json = "application/json"
    case formURLEncoded = "application/x-www-form-urlencoded"
    case multipart = "multipart/form-data"
    case boundary = "multipart/form-data; boundary=--------------------------088556105792885296757316"
}

// MARK: - API HTTP Request Methods
enum _HTTPMethod: String {
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
}
