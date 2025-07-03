//
//  AuthAPIImpl.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Foundation
protocol AuthAPI {
    func login(email: String, password: String) async throws -> AuthResponse
}

class AuthAPIImpl: AuthAPI {
    func login(email: String, password: String) async throws -> AuthResponse {
        let url = URL(string: "https://api.example.com/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(["email": email, "password": password])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(AuthResponse.self, from: data)
    }
}

