//
//  Enums.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import UIKit

enum MyApp_DateFormats:String {
    case EEMMMddyyyy = "EE MMM dd yyyy"
}

/// News period values
enum NewsPeriod: String {
    case sevenDays = "7.json"
    case oneDay = "1.json"
    case thirtyDays = "30.json"
}

/// News sections values
enum NewsSection: String {
    case all = "all-sections"
}

