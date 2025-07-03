//
//  NavigationRouter.swift
//  PracticeProject1
//
//  Created by Abhishek Maurya on 03/07/25.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case dashboard
    case login
    case registration
}

class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ route: Route) {
        path.append(route)
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}

