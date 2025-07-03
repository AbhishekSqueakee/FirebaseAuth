//
//  AuthRepository.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Foundation

protocol AuthRepository {
    func login(email: String, password: String) async throws -> User
    func register(email: String, password: String) async throws -> User
    func logout() throws
    func getSavedUser() async throws -> User?
}
