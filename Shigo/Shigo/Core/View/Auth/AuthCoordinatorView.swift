//
//  AuthCoordinatorView.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct AuthCoordinatorView: View {
    
    @StateObject private var coordinator = AuthCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .loginView)
                .navigationDestination(for: AuthPages.self) { page in
                    coordinator.build(page: page)
                        .navigationBarBackButtonHidden(true)
                }
        }
        .environmentObject(coordinator)
    }
}

enum AuthPages: String, Identifiable {
    case loginView,registerView, subsView
    
    var id: String {
        self.rawValue
    }
}

class AuthCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: AuthPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: AuthPages) -> some View {
        switch page {
        case .loginView:
            LoginView()
        case .registerView:
            RegisterView()
        case .subsView:
            SubsView()
        }
    }
}
