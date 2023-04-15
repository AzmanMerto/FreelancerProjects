//
//  SplashViewModel.swift
//  Metin2Hanesi
//
//  Created by NomoteteS on 15.04.2023.
//

import Foundation

class SplashViewModel: ObservableObject {
    
    @Published var isStartedApp: Bool
    
    init(isStartedApp: Bool = false) {
        self.isStartedApp = isStartedApp
    }
    
    func startApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isStartedApp.toggle()
        }
    }
}
