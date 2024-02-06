//
//  AppCoordinator.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 06.02.2024.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow
    
    internal var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let mainViewControllerCoordinator = MainViewControllerCoordinator(navigtionController: navigationController)
        add(coordinator: mainViewControllerCoordinator)
        mainViewControllerCoordinator.start()
    }
}
