//
//  NetworkKitAuthManager.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation

public final class NetworkKitAuthManager {
    public static let shared = NetworkKitAuthManager()
    
    private init() {
        if InstallStateManager.isFreshInstall() {
            clearAuthData()
        }
    }
    
    private let accessTokenKey = Constants.Network.ACCESS_TOKEN_KEY
    private let refreshTokenKey = Constants.Network.REFRESH_TOKEN_KEY
    
    public var authorization: String? {
        return KeychainHelper.getValue(forKey: accessTokenKey)
    }
    
    public var refreshToken: String? {
        return KeychainHelper.getValue(forKey: refreshTokenKey)
    }
    
    public func setAuthData(token: String, isRefreshToken: Bool = false) {
        let key = isRefreshToken ? refreshTokenKey : accessTokenKey
        KeychainHelper.save(value: token, forKey: key)
    }
    
    public func clearAuthData() {
        KeychainHelper.deleteValue(forKey: accessTokenKey)
        KeychainHelper.deleteValue(forKey: refreshTokenKey)
    }
}
