//
//  LoginRepository.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation

protocol LoginRepository{
    func login(email: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
