//
//  LaunchDetailViewModel.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 05/06/25.
//

import Foundation

@MainActor
final class LaunchDetailViewModel: ObservableObject {
    @Published var detail: ExGraphQLAPI.LaunchDetailsQuery.Data.Launch? = nil
    @Published var error: String? = nil
    @Published var isLoading = false
    @Published var showErrorAlert = false
    
    private let usecase: LaunchDetailUsecase
    
    init (usecase: LaunchDetailUsecase) {
        self.usecase = usecase
    }
    
    func fetchLaunchDetail(launchId: String?, forceReload: Bool = false) {
        guard let launchId = launchId else {
            return
        }
        
        error = nil
        isLoading = true
        
        usecase.loadLaunchDetail(id: launchId, forceReload: forceReload, completion: { result in
            self.isLoading = false
            switch result {
            case .success(let launch):
                self.detail = launch?.launch
            case .failure(let error):
                self.error = error.localizedDescription
            }
        })
    }
}
