//
//  ProfileHomeViewController.swift
//  IGTIBank
//
//  Created by Mário Galvao on 30/01/21.
//

import UIKit
import OpenAPIClient

class ProfileHomeViewController: ViewController {
    
    @IBOutlet weak var personActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var bankActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var agencyLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    
    var viewModelDelegate: ProfileHomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Perfil"
        
        setLabelsVisible(false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModelDelegate?.getMyInfo()
    }
    
    private func setLabelsVisible(_ visible: Bool) {
        [personActivityIndicator, bankActivityIndicator].forEach { (activityIndicator) in
            activityIndicator?.isHidden = visible
        }
        [nameLabel, emailLabel, cpfLabel, phoneLabel, bankLabel, agencyLabel, accountLabel].forEach { (label) in
            label?.isHidden = !visible
        }
    }
    
    @IBAction func needHelp(_ sender: Any) {
        viewModelDelegate?.needHelp()
    }
    
    @IBAction func logout(_ sender: Any) {
        viewModelDelegate?.logout()
    }
    
}

protocol ProfileHomeViewControllerProtocol: ViewControllerProtocol {
    
    func setMyInfo(_ myInfo: MyInfo)
    
}

extension ProfileHomeViewController: ProfileHomeViewControllerProtocol {
    
    func setMyInfo(_ myInfo: MyInfo) {
        nameLabel.text = "Nome: \(myInfo.name)"
        emailLabel.text = "E-mail: \(myInfo.email)"
        cpfLabel.text = "CPF: \(myInfo.cpf)"
        phoneLabel.text = "Celular: \(myInfo.phone)"
        bankLabel.text = "Banco: \(myInfo.bank)"
        agencyLabel.text = "Agência: \(myInfo.agency)"
        accountLabel.text = "Conta: \(myInfo.account)"
        setLabelsVisible(true)
    }
    
}
