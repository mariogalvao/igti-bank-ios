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
        
        viewControllers = [account()]
    }
    
    private func account() -> NavigationController {
        let accountCoordinator = AccountCoordinator()
        return accountCoordinator.firstViewController()
    }
    
}

protocol TabBarControllerProtocol {}
