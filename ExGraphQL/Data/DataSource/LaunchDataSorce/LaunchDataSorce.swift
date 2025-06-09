//
//  LaunchDataSorce.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 05/06/25.
//

import Foundation
import Combine
import Apollo

protocol LaunchDataSorceProtocol {
    func fetchLaunches(from cursor: String?, completion: @escaping (Result<ExGraphQLAPI.LaunchListQuery.Data?, Error>) -> Void)
    func fetchLaunchDetails(id: String, forceReload: Bool, completion: @escaping (Result<ExGraphQLAPI.LaunchDetailsQuery.Data?, Error>) -> Void)
    func subscribeToTripsBooked(handler: @escaping (Result<Int?, Error>) -> Void) -> Combine.Cancellable
}

struct LaunchDataSorce {
    private init() {}
    
    static let shared: LaunchDataSorce = LaunchDataSorce()
}

extension LaunchDataSorce: LaunchDataSorceProtocol{
    func fetchLaunches(from cursor: String?,completion: @escaping (Result<ExGraphQLAPI.LaunchListQuery.Data?, any Error>) -> Void) {
        NetworkKit.shared.apollo.fetch(query: ExGraphQLAPI.LaunchListQuery(cursor: cursor ?? .null)){ result in
            switch result {
                case .success(let graphQLResult):
                completion(.success(graphQLResult.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchLaunchDetails(id: String, forceReload: Bool, completion: @escaping (Result<ExGraphQLAPI.LaunchDetailsQuery.Data?, any Error>) -> Void) {
        let cachePolicy: CachePolicy = forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch
        
        NetworkKit.shared.apollo.fetch(query: ExGraphQLAPI.LaunchDetailsQuery(launchId: id), cachePolicy: cachePolicy){ result in
            switch result {
                case .success(let graphQLResult):
                completion(.success(graphQLResult.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func subscribeToTripsBooked(handler: @escaping (Result<Int?, any Error>) -> Void) -> Combine.Cancellable {
        let activeSubscription = NetworkKit.shared.apollo.subscribe(subscription: ExGraphQLAPI.TripsBookedSubscription()){ result in
            switch result {
            case .success(let graphQLResult):
                if let launchData = graphQLResult.data {
                    handler(.success(launchData.tripsBooked))
                    
                } else if let errors = graphQLResult.errors,
                          let first = errors.first{
                    handler(.failure(ServiceError.generic(first)))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    
        return ApolloCancellableWrapper(activeSubscription)
    }
}
