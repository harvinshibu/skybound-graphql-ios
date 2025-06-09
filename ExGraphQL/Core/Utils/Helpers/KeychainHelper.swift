//
//  KeychainHelper.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Security
import Foundation

final class KeychainHelper {
    static func save(value: String, forKey key: String) {
        guard let data = value.data(using: .utf8) else { return }
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ] as CFDictionary
        
        // Delete existing item if it exists
        SecItemDelete(query)
        
        // Add new value
        SecItemAdd(query, nil)
    }
    
    static func getValue(forKey key: String) -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)
        
        if status == errSecSuccess, let data = result as? Data {
            return String(data: data, encoding: .utf8)
        }
        
        return nil
    }
    
    static func deleteValue(forKey key: String) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ] as CFDictionary
        
        SecItemDelete(query)
    }
}
