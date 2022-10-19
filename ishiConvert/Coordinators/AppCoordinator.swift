//
//  AppCoordinator.swift
//  ishiConvert
//
//  Created by Leah Joy Ylaya on 7/6/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let convertVC = ConvertCoordinator(navigationController: navigationController)
        childCoordinators.append(convertVC)
        convertVC.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
     
}
