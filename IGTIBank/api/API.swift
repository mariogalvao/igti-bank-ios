//
//  API.swift
//  IGTIBank
//
//  Created by Mário Galvao on 17/01/21.
//

import UIKit

class API {
    
    func handleResponse<T>(response: T?, error: Error?, complete: @escaping (Result<T, APIError>) -> Void) {
        if let error = error {
            let handledError = handleError(error)
            complete(.failure(handledError))
        } else if let response = response {
            complete(.success(response))
        } else {
            fatalError("Unable to handle API response. Both response and error are nil.")
        }
    }
    
    func handleError(_ error: Error) -> APIError {
        if let apiError = error as? APIError {
            return apiError
        } else {
            return APIError(.unknown)
        }
    }

}

protocol APIProtocol {}
