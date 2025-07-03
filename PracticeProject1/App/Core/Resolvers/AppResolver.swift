//
//  Resolver.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Resolver

@MainActor
class AppResolver: ResolverRegistering {
    public static func registerAllServices() {
        Resolver.register { FirebaseAuthAPI() as AuthAPI }
        Resolver.register { KeychainUserStore() as UserStore }
        Resolver.register { AuthRepositoryImpl(api: Resolver.resolve(), userStore: Resolver.resolve()) as AuthRepository }
        Resolver.register { LoginUseCaseImpl(repo: Resolver.resolve()) as LoginUseCase }
        Resolver.register { RegistrationUseCaseImpl(repo: Resolver.resolve()) as RegistrationUseCase }
        Resolver.register { DashboardUseCaseImpl(repo: Resolver.resolve()) as DashboardUseCase }
        Resolver.register { LoginViewModel() }
        Resolver.register { RegistrationViewModel() }
        Resolver.register { DashboardViewModel() }
    }
}
