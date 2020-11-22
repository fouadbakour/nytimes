//
//  BaseViewController.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import UIKit

var __oldUIBarButtonItem:UIBarButtonItem?
class BaseViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 0.1403048337, green: 0.1452676058, blue: 0.1451510191, alpha: 1)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func hideNavBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setTitle(_ title:String) {
        self.navigationItem.title = title
    }
    
}
