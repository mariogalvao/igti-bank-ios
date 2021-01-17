//
//  MenuTableView.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class MenuTableView: UITableView {

    var menuSectionList: [MenuSection] = []
    var menuDelegate: MenuTableViewProtocol? {
        didSet {
            delegate = self
            dataSource = self
        }
    }
    
    private var menuSection: MenuSection? {
        return menuSectionList.first(where: { $0.type == .menu })
    }
    
    func setMenuSectionList(_ menuSectionList: [MenuSection]) {
        self.menuSectionList = menuSectionList
        register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        reloadData()
    }

}

protocol MenuTableViewProtocol {
    
    func getCustomCellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell?
    func didSelect(menu: Menu)
    
}

extension MenuTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menuSection = self.menuSection,
           menuSection.menus?.count ?? 0 > indexPath.row {
            menuDelegate?.didSelect(menu: menuSection.filteredMenus![indexPath.row])
        }
    }
    
}

extension MenuTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuSectionList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch menuSectionList[section].type {
        case .menu:
            return menuSectionList[section].filteredMenus?.count ?? 0
        case .customCell:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuSectionList[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch menuSectionList[indexPath.section].type {
        case .menu:
            return getMenuCell(tableView, cellForRowAt: indexPath)
        case .customCell:
            return menuDelegate?.getCustomCellForRowAt(tableView, indexPath: indexPath) ?? UITableViewCell()
        }
    }
    
    private func getMenuCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell,
              let menuSection = self.menuSection,
              let menu = menuSection.filteredMenus?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.setUp(icon: menu.icon, title: menu.title, details: menu.details)
        return cell
    }
    
}
