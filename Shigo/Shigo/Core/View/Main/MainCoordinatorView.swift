//
//  MainCoordinatorView.swift
//  Shigo
//
//  Created by NomoteteS on 10.03.2023.
//

import SwiftUI

struct MainCoordinatorView: View {
    
    @StateObject private var coordinator = MainCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .home)
                .navigationDestination(for: MainPages.self) { page in
                    coordinator.build(page: page)
                        .navigationBarBackButtonHidden(true)
                }
        }
        .environmentObject(coordinator)
    }
}

enum MainPages: String, Identifiable {
    case home,order,search,buyShi,profile
    
    var id: String {
        self.rawValue
    }
}

class MainCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: MainPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: MainPages) -> some View {
        switch page {
        case .home:
            HomeView()
        case .order:
            OrderView()
        case .search:
            SearchView()
        case .buyShi:
            BuyShiView()
        case .profile:
            ProfileView()
        }
    }
}
