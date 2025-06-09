//
//  ExGraphQLApp.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import SwiftUI

@main
struct ExGraphQLApp: App {
    @StateObject var router = Router()
    @StateObject private var appState = AppState.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path){
                switch appState.initScreen {
                case .home:
                    HomeView()
                        .navigationDestination(for: Route.self){ route in
                            route.destination
                        }
                case .login:
                    LoginView()
                        .navigationDestination(for: Route.self){ route in
                            route.destination
                        }
                }
            }
            .environmentObject(router)
            .onChange(of: appState.isLogout) { oldValue, isLogout in
                if isLogout {
                    router.toRoot()
                    self.appState.isLogout = false
                }
            }
        }
    }
}
