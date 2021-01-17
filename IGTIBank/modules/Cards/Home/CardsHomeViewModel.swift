//
//  CardsHomeViewModel.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit
import OpenAPIClient

class CardsHomeViewModel: ViewModel {
    
    private var viewControllerDelegate: CardsHomeViewControllerProtocol
    private var coordinatorDelegate: CardsCoordinatorProtocol
    private var menuSectionList: [MenuSection]
    private var cards: [Card] = []
    
    init(viewControllerDelegate: CardsHomeViewControllerProtocol, coordinatorDelegate: CardsCoordinatorProtocol, menuSectionList: [MenuSection] = MenuSection.getCardsMenuSectionList()) {
        self.viewControllerDelegate = viewControllerDelegate
        self.coordinatorDelegate = coordinatorDelegate
        self.menuSectionList = menuSectionList
    }

}

protocol CardsHomeViewModelProtocol: ViewModelProtocol {
    
    func getCards()
    func getNumberOfCards() -> Int
    func selectItem(for menu: Menu)
    func getCard(for row: Int) -> Card?
    
}

extension CardsHomeViewModel: CardsHomeViewModelProtocol {
    
    func getCards() {
        cardsAPI.getCards { (result) in
            switch result {
            case .success(let cards):
                self.cards = cards
                self.viewControllerDelegate.updateMenus(self.menuSectionList)
            case .failure(let error):
                print(error.message)
            }
        }
    }
    
    func getNumberOfCards() -> Int {
        return cards.count
    }
    
    func selectItem(for menu: Menu) {
        coordinatorDelegate.itemSelected(for: menu)
    }
    
    func getCard(for row: Int) -> Card? {
        if cards.count > row {
            return cards[row]
        } else {
            return nil
        }
    }
    
}
