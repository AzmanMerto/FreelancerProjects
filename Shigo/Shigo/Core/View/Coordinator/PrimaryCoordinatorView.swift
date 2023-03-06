//
//  PrimaryCoordinatorView.swift
//  Shigo
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct PrimaryCoordinatorView: View {
    
    @StateObject private var coordinator = PrimaryCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .splashView)
                .navigationDestination(for: Pages.self) { page in
                    coordinator.build(page: page)
                        .navigationBarBackButtonHidden(true)
                }
        }
        .environmentObject(coordinator)
    }
}

enum Pages: String, Identifiable {
    case splashView,loginView,registerView
    
    var id: String {
        self.rawValue
    }
}

class PrimaryCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: Pages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Pages) -> some View {
        switch page {
        case .splashView:
            SplashView()
        case .loginView:
            LoginView()
        case .registerView:
            RegisterView()
        }
    }
}
