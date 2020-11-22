//
//  APIResponse.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

// MARK:- API Response Status
enum ResponseStatus: Int {
    /* CHANGE IT TO EXACT CODE USED IN YOUR PROJECT */
    case success = 1
    case failure = 0
    case conenctionTimeout = -1
    case notReachable = -2
}

// MARK:- API Response Message
struct ResponseMessage {
    static let serverUnreachable: String = translate("serverUnreachable")
    static let connectionTimeout: String = translate("reqTimeout")
    static let noInternetConnection: String = translate("noInternet")
}

// MARK:- API Response Data
struct ResponseData {
    var status:ResponseStatus?
    var message: String = String()
    var data: Data? = nil
    var httpStatusCode:Int?
    var generalErrorMessage:String = translate("something_went_wrong")
    init() {}
}
