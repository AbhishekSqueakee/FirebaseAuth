//
//  DashboardViewModel.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 02/07/25.
//

import Foundation
import Resolver

class DashboardViewModel: ObservableObject {
    
    @Injected var usecase: DashboardUseCase
    
    func logout() {
        Task {
            do {
                try await usecase.execute()
            } catch {
                
            }
        }
    }
}
