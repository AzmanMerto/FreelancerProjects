//
//  SplashViewModel.swift
//  TOOF Audio
//
//  Created by NomoteteS on 14.02.2023.
//

import SwiftUI


class SplashViewModel : ObservableObject {
    
    @Published var isAppReady : Bool
    
    init(isAppReady: Bool = false) {
        self.isAppReady = isAppReady
        self.fakeReady()
    }
    
    func fakeReady() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isAppReady = true
        }
    }
}
