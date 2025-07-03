//
//  LoginUseCase.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

protocol LoginUseCase {
    func execute(email: String, password: String) async throws -> User
}

class LoginUseCaseImpl: LoginUseCase {
    let repo: AuthRepository

    init(repo: AuthRepository) {
        self.repo = repo
    }

    func execute(email: String, password: String) async throws -> User {
        let result = try await repo.login(email: email, password: password)
        let firebaseUser = result

        return User(
            id: firebaseUser.id,
            email: firebaseUser.email,
            name: firebaseUser.name
        )
    }
}


