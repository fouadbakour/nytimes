//
//  Logger.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation
class Logger {
    
    static func log(target:Any) {
        let appName = Bundle.main.displayName
        print("[\(appName)]: \(target)")
    }
}
