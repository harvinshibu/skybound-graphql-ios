//
//  AuthorizationInterceptor.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation
import Apollo

/// If you want to debug any API calls, for debugging assign 1
/// Important: Should be ZERO, always when committing
let DEBUG_NETWORK = 1

class AuthorizationInterceptor: ApolloInterceptor {
    
    var  id = UUID().uuidString
    
    func interceptAsync<Operation>(chain: any RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, any Error>) -> Void) where Operation : GraphQLOperation {
        if let token = NetworkKitAuthManager.shared.authorization{
            request.addHeader(name: Constants.Network.AUTHORIZATION, value: token)
        }
        
        if DEBUG_NETWORK == 1{
            print("GraphQL Request:")
            print("Operation: \(Operation.operationName)")
            print("Variables: \(request.graphQLEndpoint)")
            print("Headers: \(request.additionalHeaders)")
        }
        
        chain.proceedAsync(request: request, response: response, interceptor: self) { result in
            if DEBUG_NETWORK == 1{
                if let response = response {
                    print("GraphQL Response:")
                    print("Status Code: \(response.httpResponse.statusCode)")
                    print("Headers: \(response.httpResponse.allHeaderFields)")
                }
                switch result {
                case .success(let graphQLResponse):
                    let body = graphQLResponse.asJSONDictionary()
                    print("Data: \(String(describing: body))")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
            
            completion(result)
        }
    }
}
