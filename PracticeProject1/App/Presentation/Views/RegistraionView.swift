//
//  RegistraionView.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import SwiftUI
import Resolver

struct RegistraionView: View {
    @StateObject var viewModel: RegistrationViewModel = Resolver.resolve()
    @EnvironmentObject var router: NavigationRouter
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)

            if !viewModel.isEmailValid {
                Text("Please enter valid email")
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .textFieldStyle(.roundedBorder)

            if !viewModel.isPasswordMatching && !viewModel.confirmPassword.isEmpty {
                Text("Passwords do not match")
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button("Register") {
                viewModel.register()
                if viewModel.isSuccessAuth {
                    router.push(.dashboard)
                }
            }
            .disabled(!viewModel.isPasswordMatching && viewModel.isEmailValid)
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
        }
    }
    
    
}
