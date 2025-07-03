//
//  AuthAPIImpl.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Foundation
import FirebaseAuth

protocol AuthAPI {
    func login(email: String, password: String) async throws -> User
    func register(email: String, password: String) async throws -> User
    func logout() throws
    func getCurrentUser() async throws -> User?
}

class FirebaseAuthAPI: AuthAPI {
    func login(email: String, password: String) async throws -> User {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        let firebaseUser = result.user

        return User(id: firebaseUser.uid, email: firebaseUser.email ?? "", name: "")
    }

    func register(email: String, password: String) async throws -> User {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        let firebaseUser = result.user

        return User(id: firebaseUser.uid, email: firebaseUser.email ?? "", name: "")
    }

    func logout() throws {
        try Auth.auth().signOut()
    }

    func getCurrentUser() async throws -> User? {
        guard let firebaseUser = Auth.auth().currentUser else { return nil }

        return User(
            id: firebaseUser.uid,
            email: firebaseUser.email ?? "",
            name: firebaseUser.displayName ?? ""
        )
    }
}

