//
//  UITableViewExt.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import Foundation
import Spruce

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
    func reloadDataAnimated() {
        self.isHidden = true
        DispatchQueue.main.async {
            self.reloadData()
            Utils.delay(delay: 0.3) {
                self.isHidden = false
                self.spruce.animate([.slide(.down, .severely), .fadeIn], animationType: SpringAnimation(duration: 1.5), sortFunction: CorneredSortFunction(corner: .topLeft, interObjectDelay: 0.08))
            }
        }
    }
    func reloadDataAnimated2() {
        
        self.isHidden = true
        DispatchQueue.main.async {
            self.reloadData()
            Utils.delay(delay: 0.3) {
                self.isHidden = false
                self.spruce.animate([.slide(.down, .severely), .expand(.severely)], animationType: SpringAnimation(duration: 2.0), sortFunction: CorneredSortFunction(corner: .topLeft, interObjectDelay: 0.08))
            }
        }
    }
    func reloadDataAnimated3() {
        
        self.isHidden = true
        DispatchQueue.main.async {
            self.reloadData()
            Utils.delay(delay: 0.3) {
                self.isHidden = false
                self.spruce.animate([.slide(.up, .severely), .contract(.severely)], animationType: SpringAnimation(duration: 1.0), sortFunction: CorneredSortFunction(corner: .topRight, interObjectDelay: 0.08))
            }
        }
    }
    func reloadAsync() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
