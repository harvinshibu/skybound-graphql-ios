//
//  LaunchRepositoryImpl.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 04/06/25.
//

import Foundation
import Combine

final class LaunchRepositoryImpl: LaunchRepository {
    
    private let dataSource: LaunchDataSorce
    
    init(dataSource: LaunchDataSorce) {
        self.dataSource = dataSource
    }
    
    func fetchLaunches(from cursor: String?, completion: @escaping (Result<ExGraphQLAPI.LaunchListQuery.Data?, any Error>) -> Void) {
        dataSource.fetchLaunches(from: cursor, completion: completion)
    }
    
    func fetchLaunchDetails(id: String, forceReload: Bool, completion: @escaping (Result<ExGraphQLAPI.LaunchDetailsQuery.Data?, any Error>) -> Void) {
        dataSource.fetchLaunchDetails(id: id, forceReload: forceReload, completion: completion)
    }
    
    func subscribeToTripsBooked(handler: @escaping (Result<Int?, any Error>) -> Void) -> any Cancellable {
        return dataSource.subscribeToTripsBooked(handler: handler)
    }
}
