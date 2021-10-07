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
        
        viewControllers = [account(), cards(), investments(), profile()]
    }
    
    private func account() -> NavigationController {
        let coordinator = AccountCoordinator()
        return coordinator.firstViewController()
    }
    
    private func cards() -> NavigationController {
        let coordinator = CardsCoordinator()
        return coordinator.firstViewController()
    }
    
    private func investments() -> NavigationController {
        let coordinator = InvestCoordinator()
        return coordinator.firstViewController()
    }
    
    private func profile() -> NavigationController {
        let coordinator = ProfileCoordinator()
        return coordinator.firstViewController()
    }
    
}

protocol TabBarControllerProtocol {}
