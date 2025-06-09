//
//  LoginUsecase.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation

protocol LoginUsecase{
    func execute(email: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

final class LoginUsecaseImpl: LoginUsecase{
    let repo: LoginRepository
    
    init(repo: LoginRepository) {
        self.repo = repo
    }
    
    func execute(email: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
        repo.login(email: email, completion: completion)
    }
}
