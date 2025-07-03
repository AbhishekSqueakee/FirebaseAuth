//
//  PracticeProject1App.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import SwiftUI
import FirebaseCore
import AppIntents

@main
struct PracticeProject1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        AppResolver.registerAllServices()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
