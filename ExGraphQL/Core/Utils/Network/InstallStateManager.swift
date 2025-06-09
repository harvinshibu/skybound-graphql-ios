//
//  InstallStateManager.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//


import Foundation

final class InstallStateManager {
    private static let installFlagKey = "com.harvin.exgraphql"
    
    static func isFreshInstall() -> Bool {
        let isFreshInstall = UserDefaults.standard.bool(forKey: installFlagKey) == false
        if isFreshInstall {
            UserDefaults.standard.set(true, forKey: installFlagKey)
            UserDefaults.standard.synchronize()
        }
        return isFreshInstall
    }
}
