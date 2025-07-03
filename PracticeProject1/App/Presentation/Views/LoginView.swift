//
//  LoginView.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import SwiftUI
import Resolver

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = Resolver.resolve()
    @EnvironmentObject var router: NavigationRouter
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                viewModel.login()
                if viewModel.isSuccessAuth {
                    router.push(.dashboard)
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(!viewModel.isFieldsNotEmpty || !viewModel.isEmailValid)
        }
        .padding()
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
        }
    }
}

