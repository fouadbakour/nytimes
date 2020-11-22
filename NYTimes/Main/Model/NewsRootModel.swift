//
//  NewsRootModel.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright © 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

struct NewsRootModel: Codable {
    let status: String?
    let copyright: String?
    let numResults: Int?
    let results: [ResultModel]?
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}
