//
//  ProfileHomeViewModel.swift
//  IGTIBank
//
//  Created by Mário Galvao on 30/01/21.
//

import UIKit

class ProfileHomeViewModel: ViewModel {
    
    private var viewControllerDelegate: ProfileHomeViewControllerProtocol
    private var coordinatorDelegate: ProfileCoordinatorProtocol
    
    init(viewControllerDelegate: ProfileHomeViewControllerProtocol, coordinatorDelegate: ProfileCoordinatorProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
        self.coordinatorDelegate = coordinatorDelegate
    }

}

protocol ProfileHomeViewModelProtocol: ViewModelProtocol {
    
    func getMyInfo()
    func needHelp()
    func logout()
    
}

extension ProfileHomeViewModel: ProfileHomeViewModelProtocol {
    
    func getMyInfo() {
        accountAPI.getMyInfo { (result) in
            switch result {
            case .success(let myInfo):
                self.viewControllerDelegate.setMyInfo(myInfo)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func needHelp() {
        coordinatorDelegate.support()
    }
    
    func logout() {
        coordinatorDelegate.logout()
    }
    
}
