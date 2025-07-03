//
//  Resolver.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Resolver

@MainActor
extension AppResolver: ResolverRegistering {
    public static func registerAllServices() {
        register { FirebaseAuthAPI() as AuthAPI }
        register { KeychainTokenStore() as TokenStore }
        register { AuthRepositoryImpl(api: resolve(), tokenStore: resolve()) as AuthRepository }
        register { LoginUseCaseImpl(repo: resolve()) as LoginUseCase }
        register { LoginViewModel() }
    }
}
