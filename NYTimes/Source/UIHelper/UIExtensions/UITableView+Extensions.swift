//
//  UITableViewExt.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation

extension UITableView {
    func endRefreshing() {
        self.contentOffset = CGPoint.init(x: 0, y: 0)
        Utils.delay(delay: 0.1) {
            self.refreshControl?.endRefreshing()
        }
    }
    func beginRefreshing() {
        self.contentOffset = CGPoint.init(x: 0, y: -60)
        Utils.delay(delay: 0.1) {
            self.refreshControl?.beginRefreshing()
        }
    }
    func setRefreshcontrol(color:UIColor = .darkGray, target:UIViewController, action:Selector)  {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = color
        refreshControl.addTarget(target, action: action, for: .valueChanged)
        self.refreshControl = refreshControl
    }
    func reloadAsync() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
