//
//  LoginViewModel.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Foundation
import Resolver
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isSuccessAuth = false
    
    @Injected var loginUseCase: LoginUseCase
    @EnvironmentObject var appState: AppState

    var isEmailValid: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return predicate.evaluate(with: email)
    }
    
    var isFieldsNotEmpty: Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    func login() {
        Task {
            do {
                let user = try await loginUseCase.execute(email: email, password: password)
                await MainActor.run {
                    appState.user = user
                    isSuccessAuth = true
                }
            } catch {
                await MainActor.run {
                    showError = true
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}

