//
//  SplashViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 27.03.2023.
//

import Foundation

class SplashViewModel: ObservableObject {
    
    var coordinator : splashCoordinator = .init()
    @Published var isAppActive : Bool
    
    init(coordinator: splashCoordinator = .init(),
        isAppActive: Bool = false) {
        self.coordinator = coordinator
        self.isAppActive = isAppActive
        self.activeApp()
    }
    
    func activeApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isAppActive = true
        }
    }
    
}
