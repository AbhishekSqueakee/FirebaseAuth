//
//  UserDashboardView.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import SwiftUI
import Resolver


struct UserDashboardView: View {
    @EnvironmentObject var router: NavigationRouter
    @EnvironmentObject var appState: AppState
    @Injected var viewModel: DashboardViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, \(appState.user.email)")
                .font(.title2)
                .padding()
            Text("Welcome, \(appState.user.name)")
                .font(.title2)
                .padding()
            Text("Welcome, \(appState.user.id)")
                .font(.title2)
                .padding()

            Button("Logout") {
                viewModel.logout()
                appState.user = User(id: "", email: "", name: "")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
