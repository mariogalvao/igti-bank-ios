//
//  InvestHomeViewModel.swift
//  IGTIBank
//
//  Created by Mário Galvao on 30/01/21.
//

import UIKit

class InvestHomeViewModel: ViewModel {
    
    private var viewControllerDelegate: InvestHomeViewControllerProtocol
    private var coordinatorDelegate: InvestCoordinatorProtocol
    private var menuSectionList: [MenuSection] = []
    
    init(viewControllerDelegate: InvestHomeViewControllerProtocol, coordinatorDelegate: InvestCoordinatorProtocol) {
        self.viewControllerDelegate = viewControllerDelegate
        self.coordinatorDelegate = coordinatorDelegate
    }

}

protocol InvestHomeViewModelProtocol: ViewModelProtocol {
    
    func getMyInvest()
    func getInvest()
    func selectItem(for menu: Menu)
    
}

extension InvestHomeViewModel: InvestHomeViewModelProtocol {
    
    func getMyInvest() {
        investAPI.getMyInvestments { (result) in
            switch result {
            case .success(let myInvestments):
                self.viewControllerDelegate.setBalance(myInvestments.balance)
                self.menuSectionList = MenuSection.getMyInvestMenuSectionList(for: myInvestments.investments)
                self.viewControllerDelegate.updateMenus(self.menuSectionList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getInvest() {
        investAPI.getInvestments { (result) in
            switch result {
            case .success(let investments):
                self.menuSectionList = MenuSection.getInvestMenuSectionList(for: investments)
                self.viewControllerDelegate.updateMenus(self.menuSectionList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func selectItem(for menu: Menu) {
        coordinatorDelegate.itemSelected(for: menu)
    }
    
}
