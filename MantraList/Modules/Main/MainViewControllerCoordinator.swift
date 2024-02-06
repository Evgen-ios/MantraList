//
//  MainViewControllerCoordinator.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 06.02.2024.
//

import UIKit

class MainViewControllerCoordinator: BaseCoordinator {
    private var navigtionController: UINavigationController
    
    init(navigtionController: UINavigationController) {
        self.navigtionController = navigtionController
    }
    
    override func start() {
        let mainViewController = MainViewController()
        mainViewController.mainViewControllerCoordinator = self
        navigtionController.pushViewController(mainViewController, animated: true)
    }
}
