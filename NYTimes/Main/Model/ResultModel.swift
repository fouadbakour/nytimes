//
//  ResultModel.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright © 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

struct ResultModel: Codable {
    let url: String?
    let adxKeywords: String?
    let column: String?
    let section: String?
    let byline: String?
    let type: String?
    let title: String?
    let abstract: String?
    let publishedDate: String?
    let source: String?
    let id: Int64?
    let assetID: Int?
    let views: Int?
    let media: [MediaModel]?

    // Custom variable used when we load cached news articles
    var imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx_keywords"
        case column, section, byline, type, title, abstract
        case publishedDate = "published_date"
        case source, id
        case assetID = "asset_id"
        case views
        case media
    }
}

extension ResultModel {
    static func createCachedModel(byline:String, title:String, id:Int64, publishedDate:String, imageURL:String) -> ResultModel {
        let model = ResultModel.init(url: nil,
                                     adxKeywords: nil,
                                     column: nil,
                                     section: nil,
                                     byline: byline,
                                     type: nil,
                                     title: title,
                                     abstract: nil,
                                     publishedDate: publishedDate,
                                     source: nil,
                                     id: id,
                                     assetID: nil,
                                     views: nil,
                                     media: nil,
                                     imageURL: imageURL)
        return model
    }
}
