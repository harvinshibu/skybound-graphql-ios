//
//  HomeViewModel.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var launches = [ExGraphQLAPI.LaunchListQuery.Data.Launches.Launch]()
    @Published var lastConnection: ExGraphQLAPI.LaunchListQuery.Data.Launches?
    @Published var error: String? = nil
    @Published var isLoading = false
    @Published var notificationMessage: String = ""
    @Published var showLogoutPopup: Bool = false
    @Published var showErrorAlert: Bool = false
    
    private let usecase: HomeUsecase
    private var activeSubscription: Cancellable?
    
    init(usecase: HomeUsecase) {
        self.usecase = usecase
        startBookingSubscription()
    }
  
    func startBookingSubscription() {
        activeSubscription = usecase.subscribeToTripsBooked(handler: { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let tripsBooked):
                if let tripsBooked = tripsBooked {
                    self.handleTripsBooked(value: tripsBooked)
                }
                
            case .failure(let error):
                self.error = error.localizedDescription
            }
        })
    }
    
    func stopBoolingSubscription() {
        activeSubscription?.cancel()
        activeSubscription = nil
    }
    
    private func handleTripsBooked(value: Int) {
        var message: String
        switch value {
        case 1:
            message = "A new trip was booked!"
        case -1:
            message = "A trip was cancelled!"
        default:
            message = "Unknown error"
            return
        }
        
        notificationMessage = message
    }
    
    
    func loadLaunchesIfTheyExist() {
        guard let connection = self.lastConnection else {
            Task { await self.fetchLaunches(from: nil) }
            return
        }
        
        guard connection.hasMore else { return }
        
        Task { await self.fetchLaunches(from: connection.cursor) }
    }
    
    func fetchLaunches(from cursor: String?) async {
        error = nil
        isLoading = true
        usecase.loadLaunches(from: cursor, completion: { result in
            switch result {
            case .success(let data):
                if let launchConnection = data?.launches {
                    self.lastConnection = launchConnection
                    self.launches.append(contentsOf: launchConnection.launches.compactMap { $0 })
                }
            case .failure(let failure):
                self.error = failure.localizedDescription
            }
        })
        isLoading = false
    }
}
