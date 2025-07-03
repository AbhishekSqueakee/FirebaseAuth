//
//  DashboardUseCase.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

protocol DashboardUseCase {
    func execute() async throws
}

class DashboardUseCaseImpl: DashboardUseCase {
    let repo: AuthRepository

    init(repo: AuthRepository) {
        self.repo = repo
    }

    func execute() async throws {
        try repo.logout()
    }
}

