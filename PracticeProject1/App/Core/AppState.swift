//
//  AppState.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var user: User = User(id: "", email: "", name: "")
}
