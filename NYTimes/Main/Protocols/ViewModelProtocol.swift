//
//  ViewModelProtocol.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

/// Protocols to follow in every viewModel
protocol ViewModelProtocol {
    
    // MARK: - ------------------------------ SUBMIT DATA --------------------------------
    func submitData()
    
    // MARK: - ------------------------------- GET DATA ----------------------------------
    func getData(fromRefresh:Bool, fromLoadMore:Bool)
}

extension ViewModelProtocol {
    func getData(fromRefresh:Bool, fromLoadMore:Bool) {}
    func submitData() {}
}
