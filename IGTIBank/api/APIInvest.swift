//
//  APIInvestProtocol.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit
import OpenAPIClient

protocol APIInvestmentsProtocol: APIProtocol {
    
    func getMyInvestments(completion: @escaping (Result<MyInvestments, APIError>) -> Void)
    func getInvestments(completion: @escaping (Result<[Investment], APIError>) -> Void)
    
}

class APIInvestments: API, APIInvestmentsProtocol {
    
    func getMyInvestments(completion: @escaping (Result<MyInvestments, APIError>) -> Void) {
        InvestmentsAPI.getMyInvestments { (response, error) in
            self.handleResponse(response: response, error: error, complete: completion)
        }
    }
    
    func getInvestments(completion: @escaping (Result<[Investment], APIError>) -> Void) {
        InvestmentsAPI.getInvestments { (response, error) in
            self.handleResponse(response: response, error: error, complete: completion)
        }
    }

}


