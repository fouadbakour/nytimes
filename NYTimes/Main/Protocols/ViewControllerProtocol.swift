//
//  ViewControllerProtocol.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

/// Protocols to follow in every view controlloer
protocol ViewControllerProtocol {
    func setupViewModel()
    func setupBindings()
}

extension ViewControllerProtocol {
    func setupViewModel(){}
}
