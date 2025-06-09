//
//  LaunchRepository.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 04/06/25.
//

import Foundation
import Combine

protocol LaunchRepository{
    func fetchLaunches(from cursor: String?, completion: @escaping (Result<ExGraphQLAPI.LaunchListQuery.Data?, Error>) -> Void)
    func fetchLaunchDetails(id: String, forceReload: Bool, completion: @escaping (Result<ExGraphQLAPI.LaunchDetailsQuery.Data?, Error>) -> Void)
    func subscribeToTripsBooked(handler: @escaping (Result<Int?, Error>) -> Void) -> Cancellable
}
