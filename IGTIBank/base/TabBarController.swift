//
//  TabBarController.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [account(), cards()]
    }
    
    private func account() -> NavigationController {
        let coordinator = AccountCoordinator()
        return coordinator.firstViewController()
    }
    
    private func cards() -> NavigationController {
        let coordinator = CardsCoordinator()
        return coordinator.firstViewController()
    }
    
}

protocol TabBarControllerProtocol {}
