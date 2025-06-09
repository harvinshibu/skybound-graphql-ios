//
//  AppState.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 09/06/25.
//

import Foundation

enum InitScreen {
    case home
    case login
}

final class AppState: ObservableObject {
    static let shared = AppState()
    @Published var initScreen: InitScreen = .login
    @Published var isLogout: Bool = false
    
    private init() {
        screenCheck()
    }
    
    private func screenCheck() {
        if let _ = NetworkKitAuthManager.shared.authorization {
            self.initScreen = .home
        } else {
            initScreen = .login
        }
    }
    
    func handleLogout() {
        DispatchQueue.main.async {
            self.isLogout = true
            self.initScreen = .login
            NetworkKitAuthManager.shared.clearAuthData()
        }
    }
}

