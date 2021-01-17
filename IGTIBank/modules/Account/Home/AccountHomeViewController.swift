//
//  AccountHomeViewController.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class AccountHomeViewController: ViewController {
    
    @IBOutlet weak var tableView: MenuTableView!
    
    var viewModelDelegate: AccountHomeViewModelProtocol?
    
    var balance: String = ""
    
    let searchController = SearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Conta"
        
        tableView.menuDelegate = self
        tableView.register(UINib(nibName: "BalanceTableViewCell", bundle: nil), forCellReuseIdentifier: "BalanceTableViewCell")
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModelDelegate?.getBalance()
        viewModelDelegate?.getMenuSectionList()
    }
    
    private func getBalanceCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BalanceTableViewCell", for: indexPath) as? BalanceTableViewCell else {
            return UITableViewCell()
        }
        cell.setUp(balance: balance, visible: true)
        return cell
    }

}

protocol AccountHomeViewControllerProtocol: ViewControllerProtocol {
    
    func setBalance(_ balance: String)
    func updateMenus(_ menus: [MenuSection])
    
}

extension AccountHomeViewController: AccountHomeViewControllerProtocol {
    
    func setBalance(_ balance: String) {
        self.balance = balance
    }
    
    func updateMenus(_ menus: [MenuSection]) {
        tableView.setMenuSectionList(menus)
        tableView.reloadData()
    }
    
}

extension AccountHomeViewController: MenuTableViewProtocol {
    
    func getCustomCellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        return getBalanceCell(tableView, cellForRowAt: indexPath)
    }
    
    func didSelect(menu: Menu) {
        viewModelDelegate?.selectItem(for: menu)
    }
    
}

extension AccountHomeViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModelDelegate?.filterMenus(by: text)
    }
    
}
