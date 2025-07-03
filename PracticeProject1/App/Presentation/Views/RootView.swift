//
//  RootView.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import SwiftUI

struct RootView: View {
    @StateObject var appState = AppState()
    @StateObject var router = NavigationRouter()

    var body: some View {
            NavigationStack(path: $router.path) {
                LandingScreen()
                    .environmentObject(appState)
                    .environmentObject(router)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .dashboard:
                            UserDashboardView()
                                .environmentObject(appState)
                                .environmentObject(router)
                        case .login:
                            LoginView()
                                .environmentObject(appState)
                                .environmentObject(router)
                        case .registration:
                            RegistraionView()
                                .environmentObject(appState)
                                .environmentObject(router)
                        }
                    }
            }
        }
}

