//
//  TokenStorage.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Foundation

protocol UserStore {
    func save(user: User)
    func getUser() -> User?
    func clear()
}

class KeychainUserStore: UserStore {
    private let userKey = "loggedInUser"

    func save(user: User) {
        try? KeychainService.shared.save(user, forKey: userKey)
    }

    func getUser() -> User? {
        return try? KeychainService.shared.retrieve(User.self, forKey: userKey)
    }

    func clear() {
        KeychainService.shared.delete(forKey: userKey)
    }
}
