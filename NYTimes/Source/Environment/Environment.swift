//
//  Environment.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

struct Environment {
    static let BASE_URL = Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    static let API_KEY = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
}
