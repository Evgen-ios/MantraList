//
//  AppDelegate.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 02.02.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        self.window = window
        
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        return true
    }
}
