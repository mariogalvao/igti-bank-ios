//
//  MenuSection.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class MenuSection {
    
    var sectionTitle: String
    var type: MenuSectionType
    var menus: [Menu]?
    var filteredMenus: [Menu]?
    
    init(sectionTitle: String, type: MenuSectionType, menus: [Menu]? = nil) {
        self.sectionTitle = sectionTitle
        self.type = type
        self.menus = menus
        self.filteredMenus = menus
    }
    
    static func getAccountMenuSectionList() -> [MenuSection] {
        let customSection = MenuSection(sectionTitle: "Saldo atual",
                                        type: .customCell)
        let menuSection = MenuSection(sectionTitle: "Menu",
                                      type: .menu,
                                      menus: Menu.getAccountMenus())
        return [customSection, menuSection]
    }
    
    func filterMenus(by text: String, complete: () -> Void) {
        if text.isEmpty {
            filteredMenus = menus
        } else {
            filteredMenus = menus?.filter({ (menu) -> Bool in
                return menu.title.contains(text) || menu.details.contains(text)
            })
        }
        complete()
    }
    
    static func getCardsMenuSectionList() -> [MenuSection] {
        let customSection = MenuSection(sectionTitle: "Dados do cartão",
                                        type: .customCell)
        let menuSection = MenuSection(sectionTitle: "Menu",
                                      type: .menu,
                                      menus: Menu.getCardMenus())
        return [customSection, menuSection]
    }

}

enum MenuSectionType: String {
    case menu
    case customCell
}
