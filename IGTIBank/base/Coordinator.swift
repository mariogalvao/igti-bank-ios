//
//  Coordinator.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class Coordinator {
    
    var navigationController: NavigationController
    
    init(navigationController: NavigationController = NavigationController()) {
        self.navigationController = navigationController
    }
    
    func comingSoon(title: String) -> UIViewController {
        let viewController = ComingSoonViewController()
        let viewModel = ComingSoonViewModel(viewControllerDelegate: viewController, title: title)
        viewController.viewModelDelegate = viewModel
        return viewController
    }
    
}

protocol CoordinatorProtocol {}
