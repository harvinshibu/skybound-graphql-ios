//
//  Injection.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 04/06/25.
//

import Foundation

final class Injection {
    
    private init() {}
    static let shared = Injection()

    private func provideLoginRepository() -> LoginRepository {
        let dataSource = LoginDataSource.shared
        return LoginRepositoryImpl(dataSource: dataSource)
    }

    func provideLoginUseCase() -> LoginUsecase {
        LoginUsecaseImpl(repo: provideLoginRepository())
    }
    
    private func provideLaunchRepository() -> LaunchRepository {
        let dataSource = LaunchDataSorce.shared
        return LaunchRepositoryImpl(dataSource: dataSource)
    }

    func provideHomeUseCase() -> HomeUsecase {
        HomeUsecaseImpl(repo: provideLaunchRepository())
    }
    
    func provideLaunchDetailUseCase() -> LaunchDetailUsecase {
        LaunchDetailUsecaseImpl(repo: provideLaunchRepository())
    }
}
