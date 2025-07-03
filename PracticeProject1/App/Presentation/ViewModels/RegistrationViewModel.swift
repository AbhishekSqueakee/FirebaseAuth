//
//  RegistrationViewModel.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Foundation
import Resolver
import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isSuccessAuth = false
    
    @Injected var useCase: RegistrationUseCase
    @EnvironmentObject var appState: AppState
    
    
    var isPasswordMatching: Bool {
            return !password.isEmpty && password == confirmPassword
        }
    
    var isEmailValid: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return predicate.evaluate(with: email)
    }
    
    func register() {
        Task {
            do {
                let user = try await useCase.execute(email: email, password: password)
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
