//
//  LoginDataSource.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 05/06/25.
//

import Foundation

protocol LoginDataSourceProtocol {
    func login(email: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

struct LoginDataSource {
    private init() {}
    
    static let shared: LoginDataSource = LoginDataSource()
}

extension LoginDataSource: LoginDataSourceProtocol{
    func login(email: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
        NetworkKit.shared.apollo.perform(mutation: ExGraphQLAPI.LoginMutation(email: email)){ result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors,
                   let first = errors.first {
                    completion(.failure(ServiceError.errorWith(message: first.message ?? "")))
                    return
                }
                
                if let token = graphQLResult.data?.login?.token {
                    NetworkKitAuthManager.shared.setAuthData(token: token)
                    completion(.success(true))
                } else {
                    completion(.failure(ServiceError.unknown))
                }
                
            case .failure(let error):
                completion(.failure(ServiceError.generic(error)))
            }
        }
    }
}
