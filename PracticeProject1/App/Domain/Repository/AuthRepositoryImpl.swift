//
//  AuthRepositoryImpl.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//


import Foundation

class AuthRepositoryImpl: AuthRepository {
    
    private let api: AuthAPI
    private let userStore: UserStore

    init(api: AuthAPI, userStore: UserStore = KeychainUserStore()) {
        self.api = api
        self.userStore = userStore
    }

    func login(email: String, password: String) async throws -> User {
        let user = try await api.login(email: email, password: password)
        userStore.save(user: user)
        return user
    }

    func register(email: String, password: String) async throws -> User {
        let user = try await api.register(email: email, password: password)
        userStore.save(user: user)
        return user
    }

    func logout() throws {
        try api.logout()
        userStore.clear()
    }

    func getSavedUser() async throws -> User? {
        return userStore.getUser()
    }
}
