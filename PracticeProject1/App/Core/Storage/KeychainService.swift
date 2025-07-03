//
//  KeychainService.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 03/07/25.
//

import Foundation
import Security

class KeychainService {
    static let shared = KeychainService()
    private init() {}

    func save<T: Codable>(_ object: T, forKey key: String) throws {
        let data = try JSONEncoder().encode(object)

        let query: [String: Any] = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String  : data
        ]

        SecItemDelete(query as CFDictionary) // delete if exists
        let status = SecItemAdd(query as CFDictionary, nil)

        guard status == errSecSuccess else {
            throw NSError(domain: "Keychain", code: Int(status), userInfo: [NSLocalizedDescriptionKey: "Unable to save data"])
        }
    }

    func retrieve<T: Codable>(_ type: T.Type, forKey key: String) throws -> T? {
        let query: [String: Any] = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String : kCFBooleanTrue!,
            kSecMatchLimit as String : kSecMatchLimitOne
        ]

        var item: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        guard status == errSecSuccess else { return nil }

        if let data = item as? Data {
            return try JSONDecoder().decode(T.self, from: data)
        }

        return nil
    }

    func delete(forKey key: String) {
        let query: [String: Any] = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
    }
}
