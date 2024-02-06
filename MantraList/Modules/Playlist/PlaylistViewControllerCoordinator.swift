//
//  PlaylistViewControllerCoordinator.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 06.02.2024.
//

import UIKit

class PlaylistViewControllerCoordinator: BaseCoordinator {
    private var navigtionController: UINavigationController
    
    init(navigtionController: UINavigationController) {
        self.navigtionController = navigtionController
    }
    
    override func start() {
        let viewController = PlaylistViewController()
        viewController.playlistViewControllerCoordinator = self
        if let sheet = viewController.sheetPresentationController {
            sheet.preferredCornerRadius = 26
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        
        navigtionController.present(viewController, animated: true)
    }
}
