//
//  NetworkKit.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation
import Apollo

struct NetworkKit {
    static var shared = NetworkKit()
    
    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(store: store)
        let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        return ApolloClient(networkTransport: transport, store: store)
    }()
}
