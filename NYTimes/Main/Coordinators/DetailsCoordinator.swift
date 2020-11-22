//
//  DetailsCoordinator.swift
//  NYTimes
//
//  Created by Fouad Bakour on 11/21/20.
//  Copyright (c) 2020 Eurisko Mobility. All rights reserved.
//

import FuntastyKit

private struct DetailsStoryboard: StoryboardType {
    static let name = "Details"
    static let navigationController = StoryboardReference<DetailsStoryboard, UINavigationController>(id: "DetailsNavigationControllerID")
    static let viewController = StoryboardReference<DetailsStoryboard, DetailsViewController>(id: "DetailsViewControllerID")
}

final class DetailsCoordinator: DefaultCoordinator {
    private let navigationController: UINavigationController
    weak var viewController: DetailsViewController?

    init(navigationController: UINavigationController, subtitle: NSAttributedString?, header: String?, background: UIImage?, details: String?) {
        self.navigationController = navigationController
        self.viewController = DetailsStoryboard.viewController.instantiate()
        self.viewController?.background = background
        self.viewController?.header = header
        self.viewController?.subtitle = subtitle
        self.viewController?.details = details
    }

    func start() {
        guard let viewController = viewController else {
            return
        }
        navigationController.pushViewController(viewController, animated: true)
    }

    func stop() {
        _ = navigationController.popViewController(animated: true)
    }
}

