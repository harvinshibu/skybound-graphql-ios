//
//  HomeUsecase.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 04/06/25.
//

import Foundation
import Combine

protocol HomeUsecase{
    func loadLaunches(from cursor: String?, completion: @escaping (Result<ExGraphQLAPI.LaunchListQuery.Data?, Error>) -> Void)
    func subscribeToTripsBooked(handler: @escaping (Result<Int?, any Error>) -> Void) -> any Cancellable
}

final class HomeUsecaseImpl: HomeUsecase{
    
    let repo: LaunchRepository
    
    init(repo: LaunchRepository) {
        self.repo = repo
    }
    
    func loadLaunches(from cursor: String?, completion: @escaping (Result<ExGraphQLAPI.LaunchListQuery.Data?, any Error>) -> Void) {
        repo.fetchLaunches(from: cursor, completion: completion)
    }
    
    func subscribeToTripsBooked(handler: @escaping (Result<Int?, any Error>) -> Void) -> any Cancellable {
        return repo.subscribeToTripsBooked(handler: handler)
    }
}
