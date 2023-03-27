//
//  OnboardingCoordinator.swift
//  TOOF Audio
//
//  Created by NomoteteS on 23.02.2023.
//

import SwiftUI

struct OnboardingCoordinator: View {
    
    @StateObject var coordinator = onboardingCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .onboarding)
                .navigationDestination(for: onboardingPages.self) { page in
                    coordinator.build(page: page)
                }
        }
    }
}

enum onboardingPages: String, Identifiable {
    case onboarding, NextCoordinator
    var id : String{
        return self.rawValue
    }
}

class onboardingCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: onboardingPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: onboardingPages) -> some View {
        switch page {
        case .onboarding:
            OnboardingView()
        case .NextCoordinator:
            OnboardingCoordinator()
        }
    }
}
