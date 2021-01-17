//
//  ViewModel.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class ViewModel {
    
    var accountAPI: APIAccountProtocol
    var cardsAPI: APICardsProtocol
    
    init(accountAPI: APIAccountProtocol = APIAccount(),
         cardsAPI: APICardsProtocol = APICards()) {
        self.accountAPI = accountAPI
        self.cardsAPI = cardsAPI
    }
    
}

protocol ViewModelProtocol {}
