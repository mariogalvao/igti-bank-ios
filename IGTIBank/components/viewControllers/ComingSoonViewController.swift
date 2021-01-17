//
//  ComingSoonViewController.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class ComingSoonViewController: ViewController {
    
    var viewModelDelegate: ComingSoonViewModelProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = viewModelDelegate?.getTitle()
    }

}

protocol ComingSoonViewControllerProtocol: ViewControllerProtocol {}

extension ComingSoonViewController: ComingSoonViewControllerProtocol {}
