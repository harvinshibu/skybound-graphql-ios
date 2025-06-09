//
//  NetworkInterceptorProvider.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation
import Apollo

class NetworkInterceptorProvider: DefaultInterceptorProvider{
    
    override func interceptors<Operation>(for operation: Operation) -> [any ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthorizationInterceptor(), at: 0)
        return interceptors
    }
    
}
