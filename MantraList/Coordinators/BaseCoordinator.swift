//
//  BaseCoordinator.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 06.02.2024.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    func start() {
        fatalError("BaseCoordinator Error")
    }
}
