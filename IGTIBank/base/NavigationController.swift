//
//  NavigationController.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = true
    }
    
}

protocol NavigationControllerProtocol {}
