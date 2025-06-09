//
//  LaunchDetailUsecase.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 09/06/25.
//

import Foundation

protocol LaunchDetailUsecase{
    func loadLaunchDetail(id: String, forceReload: Bool, completion: @escaping (Result<ExGraphQLAPI.LaunchDetailsQuery.Data?, Error>) -> Void)
}

final class LaunchDetailUsecaseImpl: LaunchDetailUsecase{
    
    let repo: LaunchRepository
    
    init(repo: LaunchRepository) {
        self.repo = repo
    }
    
    func loadLaunchDetail(id: String, forceReload: Bool, completion: @escaping (Result<ExGraphQLAPI.LaunchDetailsQuery.Data?, any Error>) -> Void) {
        repo.fetchLaunchDetails(id: id, forceReload: forceReload, completion: completion)
    }
}
