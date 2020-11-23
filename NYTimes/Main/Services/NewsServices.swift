//
//  NewsServices.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright © 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

extension APIManager {

    /// Get NYTimes based on selected section & period
    /// - Parameters:
    ///   - period: Period Enum
    ///   - completion: (_ error:String?, _ data:[ResultModel]?)
    func getNews(period:NewsPeriod, completion: @escaping (_ error:String?, _ data:[ResultModel]?) -> Void) {
        let endPoint = APIEndPoints.mostviewed(period: period)
        self.makeHttpRequest(endPoint: endPoint, httpMethod: .get, parameters: nil, headers: nil) { (resp) in
            if resp.status! == .success {
                if let data = resp.data {
                    Utils.parseCodable(data: data, type: NewsRootModel.self) { (decoded) in
                        
                        // Store data in CoreData for caching if applicable
                        // Used when there is no internet connection
                        for item in decoded.results ?? [] {
                            ArticleEntity.insert(model: item)
                        }
                        completion(nil, decoded.results)
                    } errorHandler: { (error) in
                        completion(error, nil)
                    }
                } else {
                    completion(resp.generalErrorMessage, nil)
                }
            } else {
                completion(resp.message, nil)
            }
        }
    }
}
