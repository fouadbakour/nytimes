//
//  APIEndPoints.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

// MARK API Endpoints
struct APIEndPoints {
    static func mostviewed(period:NewsPeriod) -> String {
        return "/svc/mostpopular/v2/viewed/\(period.rawValue)"
    }
}
