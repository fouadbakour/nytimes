//
//  BaseNavigationController.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize the main navigtion controller in the app.
        self.navigationBar.barTintColor = #colorLiteral(red: 0.1403048337, green: 0.1452676058, blue: 0.1451510191, alpha: 1)
        self.navigationBar.tintColor = UIColor.orange
        self.navigationBar.isTranslucent = false
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        self.navigationBar.titleTextAttributes = textAttributes
    }
}
