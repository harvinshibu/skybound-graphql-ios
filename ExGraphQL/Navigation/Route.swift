//
//  Route.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 04/06/25.
//

import SwiftUI

enum Route: Hashable{
    case home
    case launchDetails(launchId: String)
}

extension Route{
    @ViewBuilder
    var destination: some View{
        switch self{
        case .home:
            HomeView()
        case .launchDetails(let launchId):
            LaunchDetailsView(launchId: launchId)
        }
    }
}

final class Router: ObservableObject{
    @Published  var path = NavigationPath()
    
    public func toRoot(){
        path = .init()
    }
    
    public func pop(){
        path.removeLast()
    }
    
    public func push(_ route: Route){
        path.append(route)
    }
}
