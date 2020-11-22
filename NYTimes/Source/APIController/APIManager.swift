//
//  APIManager.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

// MARK: - API HTTP Parameters
typealias _Parameters = [String: Any]

// MARK: - API HTTP Headers
typealias _HTTPHeaders = [String: Any]

// MARK: - API CompletionHandler
typealias CompletionHandler = (_ response: ResponseData) -> Void

// MARK: - API Manager
struct APIManager {
    
    var isGettingData = false
    static var shared = APIManager.init()
    
    // MARK: - API SERVER REQUEST
    
    /// This method/function was designed & implemented to: Handle all the project API calls & HTTP requests
    ///
    /// - Parameters:
    ///   - baseURL: Mandatory param - The Base API URL
    ///   - endPoint: Mandatory param - The API endpoint to be requested
    ///   - httpMethod: Mandatory param - The HTTP method to be used
    ///   - parameters: Optional param - The Params to be used if exists
    ///   - httpFormBody: Optional param - The HTTP form body to be used if exists
    ///   - headers: Optional param - The request headers to be used if exists
    ///   - contentType: Optional param - The request content type
    ///   - refreshTokenOn401: Optional param - Handle the 401 status code - refresh token or kickout the user from the session
    ///   - fromRefreshToken: Optional param - Use it only when you call the refresh token API !!
    ///   - refreshTokenAttempt: This int value to check how many times we tried to refresh the token
    ///   - completionHandler: Request completion handler
    func makeHttpRequest(baseURL:String = Environment.BASE_URL,
                         endPoint: String,
                         httpMethod: _HTTPMethod,
                         parameters: _Parameters? = nil,
                         httpFormBody: Data? = nil,
                         headers: _HTTPHeaders? = nil,
                         contentType:ContentType? = nil,
                         refreshTokenOn401:Bool = false,
                         refreshTokenAttempt:Int = 0,
                         completionHandler: @escaping CompletionHandler) {
        
        /// This variable is used to: Handle the HTTP response in all cases
        var responseData = ResponseData()
        
        // Check internet
        if let reachability = coreapp.reachability {
            if reachability.connection == .unavailable {
                responseData.status = .failure
                responseData.message = ResponseMessage.noInternetConnection
                responseData.httpStatusCode = 0
                completionHandler(responseData)
                return
            }
        }
        
        
        /// This variable is used to: Clean up my final URL before calling HTTP request
        let myEndpoint = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                
        /// This variable is used to: guard the final URL along with base URL & Endpoint
        guard let url = URL(string: "\(baseURL)\(myEndpoint)?api-key=\(Environment.API_KEY)") else {
            responseData.status = .failure
            responseData.message = ResponseMessage.serverUnreachable
            responseData.httpStatusCode = 0
            completionHandler(responseData)
            return
        }
        
        /// This variable is used to: declare the URL request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        URLCache.shared.memoryCapacity = 0
        URLCache.shared.diskCapacity = 0
        URLCache.shared.removeAllCachedResponses()
        
        /// This variable is used to: check if content type is not nil
        if let contentType = contentType {
            urlRequest.setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
        }
        
        /// This variable is used to: check if http headers are not nil
        if let httpHeaders = headers as? [String : String] {
            urlRequest.allHTTPHeaderFields = httpHeaders
        }
        
        /// This variable is used to: check if http body is not nil
        if let httpBody = parameters {
            do {
                let postData = try JSONSerialization.data(withJSONObject: httpBody, options: [])
                urlRequest.httpBody = postData
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        if let httpFormBody = httpFormBody {
            urlRequest.httpBody = httpFormBody
        }
        
        APIManager.shared.isGettingData = true
        
        let task = coreapi.manager.dataTask(with: urlRequest) {
            (data, response, error) in
            DispatchQueue.main.async(execute: {
                
                /// This variable is used to: Cast the HTTP response
                let httpResponse = response as? HTTPURLResponse
                
                /// This variable is used to: Get HTTP req status code
                let statusCode = httpResponse?.statusCode ?? 1000
                
                /// Common response handler
                self.commonHandler(statusCode: statusCode, data: data, error: error, completionHandler: completionHandler)
            
            })
        }
        task.resume()
    }
    
    private func commonHandler(statusCode:Int, data:Data?, error:Error?, completionHandler: @escaping CompletionHandler) {
        var responseData = ResponseData()
        
        APIManager.shared.isGettingData = false
        
        guard error == nil else {
            responseData.status = .failure
            responseData.message = error?.localizedDescription ?? ResponseMessage.serverUnreachable
            responseData.httpStatusCode = statusCode
            completionHandler(responseData)
            return
        }
        
        /// This variable is used to: guard the data from HTTP request
        guard (data != nil)  else {
            responseData.status = .failure
            responseData.message = ResponseMessage.serverUnreachable
            responseData.httpStatusCode = statusCode
            completionHandler(responseData)
            return
        }
        
        // Check the status code
        switch statusCode {
        case 0...300:
            responseData.status = .success
            responseData.message = ""
            responseData.data = data
            responseData.httpStatusCode = statusCode
            completionHandler(responseData)
            break
            
        default:
            let errorMessage = ResponseMessage.serverUnreachable
            responseData.status = .failure
            responseData.message = errorMessage
            responseData.data = data
            responseData.httpStatusCode = statusCode
            completionHandler(responseData)
            break
        }

    }
}
