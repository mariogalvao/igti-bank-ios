//
//  InvestHomeViewController.swift
//  IGTIBank
//
//  Created by Mário Galvao on 30/01/21.
//

import UIKit

class InvestHomeViewController: ViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var stackViewSegmentedControl: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: MenuTableView!
    
    var viewModelDelegate: InvestHomeViewModelProtocol?
    
    var balance: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Investimentos"
        
        tableView.menuDelegate = self
        tableView.register(UINib(nibName: "BalanceTableViewCell", bundle: nil), forCellReuseIdentifier: "BalanceTableViewCell")
        
        activityIndicator.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectData()
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        selectData()
    }
    
    private func selectData() {
        activityIndicator.startAnimating()
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewModelDelegate?.getMyInvest()
        case 1:
            viewModelDelegate?.getInvest()
        default:
            break
        }
    }
    
    private func getBalanceCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BalanceTableViewCell", for: indexPath) as? BalanceTableViewCell else {
            return UITableViewCell()
        }
        cell.setUp(balance: balance, visible: true)
        return cell
    }

}

protocol InvestHomeViewControllerProtocol: ViewControllerProtocol {
    
    func setBalance(_ balance: String)
    func updateMenus(_ menus: [MenuSection])
    
}

extension InvestHomeViewController: InvestHomeViewControllerProtocol {
    
    func setBalance(_ balance: String) {
        self.balance = balance
    }
    
    func updateMenus(_ menus: [MenuSection]) {
        tableView.setMenuSectionList(menus)
        tableView.reloadData()
        activityIndicator.stopAnimating()
    }
    
}

extension InvestHomeViewController: MenuTableViewProtocol {
    
    func getCustomCellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        return getBalanceCell(tableView, cellForRowAt: indexPath)
    }
    
    func didSelect(menu: Menu) {
        viewModelDelegate?.selectItem(for: menu)
    }
    
}
