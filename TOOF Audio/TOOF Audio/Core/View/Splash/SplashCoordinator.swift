//
//  SplashCoordinator.swift
//  TOOF Audio
//
//  Created by NomoteteS on 14.02.2023.
//

import SwiftUI

struct SplashCoordinator: View {

    @StateObject var coordinator = splashCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .splash)
                .navigationDestination(for: splashPages.self) { page in
                    coordinator.build(page: page)
                }
        }
    }
}

enum splashPages: String, Identifiable {
    case splash, NextCoordinator
    var id : String{
        return self.rawValue
    }
}

class splashCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: splashPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: splashPages) -> some View {
        NavigationStack {
            switch page {
            case .splash:
                SplashView()
            case .NextCoordinator:
                OnboardingCoordinator()
            }
        }
    }
}
