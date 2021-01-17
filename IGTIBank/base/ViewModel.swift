//
//  ViewModel.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class ViewModel {
    
    var accountAPI: APIAccountProtocol
    
    init(accountAPI: APIAccountProtocol = APIAccount()) {
        self.accountAPI = accountAPI
    }
    
}

protocol ViewModelProtocol {}
