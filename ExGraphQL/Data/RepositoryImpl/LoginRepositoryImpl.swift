//
//  LoginRepositoryImpl.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation

final class LoginRepositoryImpl: LoginRepository {
    private let dataSource: LoginDataSource
    
    init(dataSource: LoginDataSource) {
        self.dataSource = dataSource
    }
    
    func login(email: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
        dataSource.login(email: email, completion: completion)
    }
}
