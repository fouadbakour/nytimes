//
//  HomeCoordinator.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import FuntastyKit

private struct HomeStoryboard: StoryboardType {
    static let name = "Home"
    static let navigationController = StoryboardReference<HomeStoryboard, UINavigationController>(id: "HomeNavigationControllerID")
    static let viewController = StoryboardReference<HomeStoryboard, HomeViewController>(id: "HomeViewControllerID")
}

final class HomeCoordinator: DefaultCoordinator {
    private let window: UIWindow
    private let navigationController: UINavigationController
    weak var viewController: HomeViewController?

    init(window: UIWindow) {
        self.window = window
        self.viewController = HomeStoryboard.viewController.instantiate()
        self.navigationController = HomeStoryboard.navigationController.instantiate()
    }

    func start() {
        DispatchQueue.main.async {
            self.animateAppStart(viewController: self.navigationController)
        }
    }
    
    private func animateAppStart(viewController:UIViewController) {
        UIView.animate(withDuration: Constants.appLaunchAnimation, animations: {
            self.window.rootViewController?.dismiss(animated: false, completion: {})
            self.window.rootViewController?.view.alpha = 0
        }, completion: { (done) in
            self.window.rootViewController = viewController
            self.window.rootViewController?.view.alpha = 0
            UIView.animate(withDuration: Constants.appLaunchAnimation, animations: {
                self.window.rootViewController?.view.alpha = 1
                self.window.window?.makeKeyAndVisible()
            }, completion: { (done) in })
        })
    }
}

