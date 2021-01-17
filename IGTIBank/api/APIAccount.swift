//
//  APIAccount.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit
import OpenAPIClient

protocol APIAccountProtocol: APIProtocol {
    
    func getBalance(completion: @escaping (Result<Balance, APIError>) -> Void)
    func getMyInfo(completion: @escaping (Result<MyInfo, APIError>) -> Void)
    
}

class APIAccount: API, APIAccountProtocol {
    
    func getBalance(completion: @escaping (Result<Balance, APIError>) -> Void) {
        AccountAPI.getMyBalance { (response, error) in
            self.handleResponse(response: response, error: error, complete: completion)
        }
    }
    
    func getMyInfo(completion: @escaping (Result<MyInfo, APIError>) -> Void) {
        AccountAPI.getMyInfo { (response, error) in
            self.handleResponse(response: response, error: error, complete: completion)
        }
    }

}
