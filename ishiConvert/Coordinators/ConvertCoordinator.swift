//
//  ConvertCoordinator.swift
//  ishiConvert
//
//  Created by Leah Joy Ylaya on 7/6/22.
//

import Foundation
import UIKit

final class ConvertCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init (navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let convertVc = ConvertViewController()
        navigationController.setViewControllers([convertVc], animated: false)
    }
    
    
}
