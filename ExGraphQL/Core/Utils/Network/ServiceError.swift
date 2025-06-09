//
//  ServiceError.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 05/06/25.
//

import Foundation

public enum ServiceError: Error, Equatable {
    public static func == (lhs: ServiceError, rhs: ServiceError) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
    
    case errorWith(message: String)
    case errorWithStatusCode(message: String, statusCode: Int)
    case generic(Error)
    case unknown
}

extension ServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .errorWith(let message):
            return message
        case .errorWithStatusCode(let message, _):
            return message
        case .generic(let e):
            return e.localizedDescription
        case .unknown:
            return "Something went wrong, Please try again later!"
        }
    }
    public var rawValue: Int {
        switch self {
        case .generic(_):
            return 1
        case .errorWith(_):
            return 2
        case .unknown:
            return 3
        case .errorWithStatusCode(_,_):
            return 4
        }
    }
}

extension ServiceError {
    var statusCode: Int? {
        switch self {
        case .errorWithStatusCode(_, let statusCode):
            return statusCode
        default:
            return nil
        }
    }
}
