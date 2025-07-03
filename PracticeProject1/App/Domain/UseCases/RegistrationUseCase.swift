//
//  RegistrationUseCase.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

protocol RegistrationUseCase {
    func execute(email: String, password: String) async throws -> User
}

class RegistrationUseCaseImpl: RegistrationUseCase {
    let repo: AuthRepository

    init(repo: AuthRepository) {
        self.repo = repo
    }

    func execute(email: String, password: String) async throws -> User {
        let result = try await repo.register(email: email, password: password)
        let firebaseUser = result

        return User(
            id: firebaseUser.id,
            email: firebaseUser.email,
            name: firebaseUser.name)
    }
}
