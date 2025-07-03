//
//  LandingScreen.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import SwiftUI

enum AuthTab: String, CaseIterable, Identifiable {
    case login = "Login"
    case register = "Register"

    var id: String { self.rawValue }
}

struct LandingScreen: View {
    @State private var selectedTab: AuthTab = .login

    @EnvironmentObject var router: NavigationRouter
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 20) {
            Picker("Authentication", selection: $selectedTab) {
                ForEach(AuthTab.allCases) { tab in
                    Text(tab.rawValue).tag(tab)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            if selectedTab == .login {
                LoginView()
                    .environmentObject(appState)
                    .environmentObject(router)
            } else {
                RegistraionView()
                    .environmentObject(appState)
                    .environmentObject(router)
            }

            Spacer()
        }
        .padding()
    }
}

