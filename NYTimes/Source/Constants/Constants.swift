//
//  Constants.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation
import UIKit


//******************** Public Usage ********************//

let appDelegate: AppDelegate? = {
    guard let _appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return nil
    }
    return _appDelegate
}()

//Shared
let coreapp = AppConfig.shared
let Services = APIManager.shared
var coreapi = APIConfig.shared

//******************** End of Public Usage ********************//

public func translate(_ key:String) -> String {
    return key.localized()
}

struct Constants {
    static let appLaunchAnimation:TimeInterval = 0.3
}
